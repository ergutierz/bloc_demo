import 'package:bloc_demo/presentation/forgot_password/forgot_password_view.dart';
import 'package:bloc_demo/presentation/register/register_view.dart';
import 'package:bloc_demo/presentation/splash/splash_view.dart';
import 'package:bloc_demo/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

import '../login/login_view.dart';
import '../main/main_view.dart';
import '../onboarding/onboarding_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteConstructor {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(
          child: Text('No Route Found'),
        ),
      );
    });
  }
}
