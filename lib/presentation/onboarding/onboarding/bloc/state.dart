import 'package:bloc_demo/util/one-time-event.dart';

import '../../mvi_onboarding/viewmodel/onboarding_pager_decorator.dart';
import 'effect.dart';

class OnboardingState {

  int currentIndex = 0;
  bool isLoading = false;
  OnBoardingPagerDecorator pagerDecorator = OnBoardingPagerDecorator().decorate();

  OnboardingState init() {
    return OnboardingState();
  }

  OnboardingState copy({
    int? currentIndex,
    bool? isLoading,
    OnBoardingPagerDecorator? pagerDecorator,
  }) {
    return OnboardingState()
      ..currentIndex = currentIndex ?? this.currentIndex
      ..isLoading = isLoading ?? this.isLoading
      ..pagerDecorator = pagerDecorator ?? this.pagerDecorator;
  }
}