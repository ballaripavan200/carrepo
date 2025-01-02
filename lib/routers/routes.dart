import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pavan_car_rental_1062/features/login/login_view/login_view.dart';
import 'package:pavan_car_rental_1062/features/signup/signup_view/signup_view.dart';
import 'package:pavan_car_rental_1062/features/splash/view/splash_view.dart';
import 'package:pavan_car_rental_1062/routers/routes_const.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

    static final GoRouter router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: RoutesConst.splashScreen,
      routes: <RouteBase>[
        GoRoute(
          path: RoutesConst.splashScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const SplashView();
          },
        ),
        GoRoute(
          path: RoutesConst.loginScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginView();
          },
        ),
        GoRoute(
          path: RoutesConst.SignupView,
          builder: (BuildContext context, GoRouterState state) {
            return const SignupView();
          },
        ),
      ],
      errorBuilder: (BuildContext context, GoRouterState state) {
        return const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        );
      }
    );
}