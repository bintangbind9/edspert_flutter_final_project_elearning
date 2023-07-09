import 'package:get/get_navigation/src/routes/get_route.dart';

import '../presentation/auth/login/login_binding.dart';
import '../presentation/auth/login/login_page.dart';
import '../presentation/auth/register/register_binding.dart';
import '../presentation/auth/register/register_page.dart';
import '../presentation/splash/splash_binding.dart';
import '../presentation/splash/splash_page.dart';
import 'routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.registerForm,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    // GetPage(
    //   name: Routes.dashboard,
    //   page: () => const DashboardPage(),
    //   bindings: [
    //     DashboardBinding(),
    //     ProfileBinding(),
    //     DiscussionBinding(),
    //   ],
    // ),
  ];
}