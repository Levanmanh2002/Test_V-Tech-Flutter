import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:test_v_tech/common/translations/localization_service.dart';
import 'package:test_v_tech/routes/app_route_constant.dart';
import 'package:test_v_tech/routes/app_routes.dart';
import 'package:test_v_tech/utils/reponsive/size_config.dart';
import 'package:test_v_tech/utils/theme/base_theme_data.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  var getMaterialApp = GetMaterialApp(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ko', 'KR'),
    ],
    localizationsDelegates: const [],
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
    localeResolutionCallback: (locale, supportedLocales) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale?.languageCode &&
            supportedLocale.countryCode == locale?.countryCode) {
          return supportedLocale;
        }
      }
      return supportedLocales.first;
    },
    debugShowCheckedModeBanner: false,
    getPages: AppPages.pages,
    initialRoute: AppRoutes.SPLASH,
    builder: EasyLoading.init(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: child!,
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: IconButton(
                    icon: Icon(Icons.model_training, color: BaseThemeData.blackColor),
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.menu, color: BaseThemeData.blackColor),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search, color: BaseThemeData.blackColor),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.print, color: BaseThemeData.blackColor),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.people, color: BaseThemeData.blackColor),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: BaseThemeData.deepPurpleColor,
            onPressed: () {},
            child: const Icon(Icons.search),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        ),
      ),
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) {
      runApp(
        LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig.init(
                  constraints,
                  designScreenWidth: 375,
                  desginScreenHeight: 812,
                );

                return getMaterialApp;
              },
            );
          },
        ),
      );
    },
  );
}
