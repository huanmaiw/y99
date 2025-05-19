import 'package:get/get.dart';
import 'package:y99/source/mvc/view/splash/splash_screen.dart';

class Routers{
  static const String splash = '/splash';
  static const String login = '/login';
  static const String myHome = '/myHome';

}
class GetPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routers.splash,
      page: () => const SplashScreen(),
    ),

  ];
}