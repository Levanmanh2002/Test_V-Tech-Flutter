import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:test_v_tech/routes/app_route_constant.dart';

class SplashController extends GetxController {
  SplashController();
  goToMainPage() async {
    FlutterNativeSplash.remove();
    loadTheme();
    loadLanguage();
    Get.offAllNamed(AppRoutes.HOME);
  }

  loadTheme() {
    // themeService.loadTheme();
  }

  loadLanguage() {
    // LocalizationService.loadLanguage();
  }

  @override
  void onInit() async {
    super.onInit();
    //await loadData();
    Future.delayed(const Duration(seconds: 2), goToMainPage);
  }
}
