import 'package:bloc_demo/presentation/error_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../presentation/forgot_password/forgot_password_view.dart';
import '../../presentation/login/login_view.dart';
import '../../presentation/main/main_view.dart';
import '../../presentation/onboarding/onboarding/view/onboarding_screen.dart';
import '../../presentation/register/register_view.dart';
import '../../presentation/splash/splash_view.dart';
import '../../presentation/store_details/store_details_view.dart';
import 'app_route_constants.dart';

class AppRouter {
  static GoRouter returnRouter(bool isAuth) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const MaterialPage(child: SplashView()),
        ),
        GoRoute(
          path: '/onBoarding',
          pageBuilder: (context, state) => const MaterialPage(child: OnboardingScreen()),
        ),
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) => const MaterialPage(child: LoginView()),
        ),
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const MaterialPage(child: RegisterView()),
        ),
        GoRoute(
          path: '/onBoarding',
          pageBuilder: (context, state) => const MaterialPage(child: ForgotPasswordView()),
        ),
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) => const MaterialPage(child: MainView()),
        ),
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) => const MaterialPage(child: StoreDetailsView()),
        ),
      ],
      errorPageBuilder: (context, state) => const MaterialPage(child: ErrorPage()),
      redirect: (context, state) {
        if (!isAuth &&
            state.location
                .startsWith('/${RoutesConstants.loginRoute}')) {
          return context.namedLocation(RoutesConstants.loginRoute);
        } else {
          return null;
        }
      },
    );
  }
}
