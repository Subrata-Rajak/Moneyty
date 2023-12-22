import 'package:go_router/go_router.dart';
import 'package:moneyty/core/routes/route_names.dart';
import 'package:moneyty/core/routes/route_paths.dart';
import 'package:moneyty/features/onboarding/presentation/views/onboard_screen.dart';

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
      )
    ],
    initialLocation: AppRoutePaths.instance.onboardScreenRoutePath,
  );
}
