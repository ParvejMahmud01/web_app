import 'package:web_app/feature/auth/login/view/login_screen.dart';
import 'package:web_app/core/const/app_export.dart';

class AppRoutes {
  static const String splashScreen = "/";
  static const String login = "/login";

  static List<GetPage> routes = [
    GetPage(
      name: login,
      page: () => LoginScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
