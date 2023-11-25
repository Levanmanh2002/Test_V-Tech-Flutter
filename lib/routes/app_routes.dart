import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_v_tech/routes/app_route_constant.dart';
import 'package:test_v_tech/screen/home/home_binding.dart';
import 'package:test_v_tech/screen/home/home_page.dart';
import 'package:test_v_tech/screen/splash/splash_binding.dart';
import 'package:test_v_tech/screen/splash/splash_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
