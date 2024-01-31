
import 'package:go_router/go_router.dart';
import 'package:todo_app/utills/routes/route_names.dart';
import 'package:todo_app/view/splash_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: AppRouteNames.initialRoute,
      builder: (context, state) => const SplashScreen(),
    ),
  ]
);