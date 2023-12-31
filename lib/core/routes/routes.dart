import 'package:go_router/go_router.dart';
import 'package:moneyty/core/routes/route_names.dart';
import 'package:moneyty/core/routes/route_paths.dart';
import 'package:moneyty/features/auth/presentation/views/login_screen.dart';
import 'package:moneyty/features/auth/presentation/views/register_screen.dart';
import 'package:moneyty/features/onboarding/presentation/views/onboard_screen.dart';
import 'package:moneyty/splash_screen.dart';

class AppRoutes {
  static AppRoutes instance = AppRoutes();

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutePaths.instance.onboardScreenRoutePath,
        name: AppRouteNames.instance.onboardScreenRouteName,
        builder: (context, state) {
          return const OnboardScreen();
        },
      ),
      GoRoute(
        path: AppRoutePaths.instance.loginScreenRoutePath,
        name: AppRouteNames.instance.loginScreenRouteName,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoutePaths.instance.splashScreenRoutePath,
        name: AppRouteNames.instance.splashScreenRouteName,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRoutePaths.instance.registerScreenPath,
        name: AppRouteNames.instance.registerScreenRouteName,
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),
    ],
    initialLocation: AppRoutePaths.instance.registerScreenPath,
  );
}
