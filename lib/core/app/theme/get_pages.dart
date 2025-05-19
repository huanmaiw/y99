import 'package:get/get.dart';
import 'package:y99/source/mvc/view/home/home_screen.dart';
import 'package:y99/source/mvc/view/login/login_screen.dart';
import 'package:y99/source/mvc/view/otp/verify_otp_screen.dart';
import 'package:y99/source/mvc/view/register/register_screen.dart';
import 'package:y99/source/mvc/view/register/password_screen.dart';
import 'package:y99/source/mvc/view/splash/splash_screen.dart';

import 'bindings.dart';

class Routers {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String verifyOtp = '/verifyOtp';
  static const String password = '/password';
  static const String forgetPassword = '/forgetPassword';
}

class GetPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routers.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routers.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routers.register,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routers.verifyOtp,
      page: () => VerifyOtpScreen(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: Routers.password,
      page: () => PasswordScreen(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: Routers.forgetPassword,
      page: () =>  PasswordScreen(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: Routers.home,
      page: () => const HomeScreen(),
      //binding: AppBindings(),
    ),
  ];
}
