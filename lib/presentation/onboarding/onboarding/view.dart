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

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    return BlocProvider(
      create: (BuildContext context) => OnBoardingBloc()..add(OnBoardingEventDefault()),
      child: BlocConsumer<OnBoardingBloc, OnboardingState>(
        listener: (context, state) {
          _handleEffect(state.oneTimeEvent.value, context, pageController);
        },
        builder: (context, state) {
          return _buildPage(context, pageController, state);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, PageController pageController, OnboardingState state) {
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
        controller: pageController,
        itemCount: state.pagerDecorator.pages.length,
        onPageChanged: (int index) {
          BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingEventUpdateIndex(index: index));
        },
        itemBuilder: (BuildContext context, int index) {
          return OnBoardingPage(page: state.pagerDecorator.pages[index]);
        },
      ),
      bottomNavigationBar: onBoardingBottomBar(context, pageController, state, BlocProvider.of<OnBoardingBloc>(context).add),
    );
  }

  void _handleEffect(OnBoardingEffect? effect, BuildContext context, PageController pageController) {
    if (effect != null) {
      if (effect is OnBoardingEffectNext) {
        pageController.nextPage(
          duration: DurationConstants.pageTransitionDuration,
          curve: Curves.easeIn,
        );
      } else if (effect is OnBoardingEffectPrevious) {
        pageController.previousPage(
          duration: DurationConstants.pageTransitionDuration,
          curve: Curves.easeIn,
        );
      } else if (effect is OnBoardingEffectSkip || effect is OnBoardingEffectFinish) {
        Navigator.pushNamed(context, Routes.loginRoute);
      }
      BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingEventDispose());
    }
  }
}