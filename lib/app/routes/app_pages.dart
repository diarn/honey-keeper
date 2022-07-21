import 'package:get/get.dart';

import 'package:honey_keeper/app/modules/home/bindings/home_binding.dart';
import 'package:honey_keeper/app/modules/home/views/home_view.dart';
import 'package:honey_keeper/app/modules/login/bindings/login_binding.dart';
import 'package:honey_keeper/app/modules/login/views/login_view.dart';
import 'package:honey_keeper/app/modules/splash/bindings/splash_binding.dart';
import 'package:honey_keeper/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: 600.milliseconds,
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.size,
      transitionDuration: 600.milliseconds,
    ),
  ];
}
