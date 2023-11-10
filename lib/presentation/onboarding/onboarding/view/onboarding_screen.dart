import 'package:bloc_demo/presentation/onboarding/onboarding/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../di/dependency_registry.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/values_manager.dart';
import '../../mvi_onboarding/view/onboarding_page.dart';
import '../bloc/bloc.dart';
import 'bottom_navigation_bar.dart';
import '../bloc/effect.dart';
import '../bloc/event.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with WidgetsBindingObserver {
  late final OnBoardingBloc _bloc;
  final PageController _pageController = PageController(initialPage: 0);
  final LocalAuthentication auth = LocalAuthentication();

  @override
  initState() {
    super.initState();
    _authenticate();
    WidgetsBinding.instance.addObserver(this);
    _bloc = instance.get<OnBoardingBloc>()
      ..add(OnBoardingEventDefault())
      ..events.listen((event) { _handleEffect(event); });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnboardingState>(
      bloc: _bloc,
      builder: (context, state) {
        return _buildScreen(context, state);
      },
    );
  }

  Widget _buildScreen(BuildContext context, OnboardingState state) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: state.pagerDecorator.pages.length,
        onPageChanged: (int index) {
          _bloc.add(OnBoardingEventUpdateIndex(index: index));
        },
        itemBuilder: (BuildContext context, int index) {
          return OnBoardingPage(page: state.pagerDecorator.pages[index]);
        },
      ),
      bottomNavigationBar: onBoardingBottomBar(context, _pageController, state, _bloc.add),
    );
  }

  _handleEffect(OnBoardingEffect effect) {
    switch(effect) {
      case OnBoardingEffectNext(): _pageController.nextPage(
          duration: DurationConstants.pageTransitionDuration,
          curve: Curves.easeIn,
        );
      case OnBoardingEffectPrevious(): _pageController.previousPage(
          duration: DurationConstants.pageTransitionDuration,
          curve: Curves.easeIn,
        );
      case OnBoardingEffectSkip() || OnBoardingEffectFinish(): Navigator.pushNamed(context, Routes.loginRoute);
    }
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
      // Do something when the app is resumed
        break;
      case AppLifecycleState.inactive:
      // The app is inactive
        break;
      case AppLifecycleState.paused:
      // The app is paused
        break;
      case AppLifecycleState.detached:
      // The app is detached
        break;
      case AppLifecycleState.hidden:
        // The app is hidden
    }
  }

  void _authenticate() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    if (canAuthenticate) {
      bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to log in',
        options: const AuthenticationOptions(biometricOnly: true),
      );

      if (didAuthenticate) {
        // Proceed to the app
      }
    }
  }

  @override
  dispose() {
    _pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
