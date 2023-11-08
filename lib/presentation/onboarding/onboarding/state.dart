import 'package:bloc_demo/util/one-time-event.dart';

import '../mvi_onboarding/onboarding_pager_decorator.dart';
import 'effect.dart';

class OnboardingState {

  int currentIndex = 0;
  bool isLoading = false;
  OnBoardingPagerDecorator pagerDecorator = OnBoardingPagerDecorator().decorate();
  OneTimeEvent<OnBoardingEffect> oneTimeEvent = OneTimeEvent(OnBoardingEffectDefault());

  OnboardingState init() {
    return OnboardingState();
  }

  OnboardingState copy({
    int? currentIndex,
    bool? isLoading,
    OnBoardingPagerDecorator? pagerDecorator,
    OneTimeEvent<OnBoardingEffect>? oneTimeEvent,
  }) {
    return OnboardingState()
      ..currentIndex = currentIndex ?? this.currentIndex
      ..isLoading = isLoading ?? this.isLoading
      ..pagerDecorator = pagerDecorator ?? this.pagerDecorator
      ..oneTimeEvent = oneTimeEvent ?? this.oneTimeEvent;
  }
}