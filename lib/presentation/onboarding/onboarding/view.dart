import 'dart:async';

import 'package:bloc_demo/presentation/onboarding/onboarding/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../mvi_onboarding/onboarding_page.dart';
import 'bloc.dart';
import 'bottom_navigation_bar.dart';
import 'effect.dart';
import 'event.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final OnBoardingBloc _bloc;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _bloc = OnBoardingBloc()
      ..add(OnBoardingEventDefault())
      ..events.listen((event) { _handleEffect(event, context); });
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

  void _handleEffect(OnBoardingEffect effect, BuildContext context) {
    switch(effect) {
      case OnBoardingEffectNext():
        _pageController.nextPage(
          duration: DurationConstants.pageTransitionDuration,
          curve: Curves.easeIn,
        );
      case OnBoardingEffectPrevious():
        _pageController.previousPage(
          duration: DurationConstants.pageTransitionDuration,
          curve: Curves.easeIn,
        );
      case OnBoardingEffectSkip() || OnBoardingEffectFinish():
        Navigator.pushNamed(context, Routes.loginRoute);
      default: {}
    }
  }
}
