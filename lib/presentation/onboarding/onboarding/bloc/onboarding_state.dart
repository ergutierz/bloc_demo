import 'package:bloc_demo/model/user_details.dart';

import '../../mvi_onboarding/viewmodel/onboarding_pager_decorator.dart';

class OnboardingState {
  UserDetails? userDetails = null;
  int currentIndex = 0;
  bool isLoading = false;
  OnBoardingPagerDecorator pagerDecorator = OnBoardingPagerDecorator().decorate();

  OnboardingState init() {
    return OnboardingState();
  }

  OnboardingState copy({
    UserDetails? userDetails,
    int? currentIndex,
    bool? isLoading,
    OnBoardingPagerDecorator? pagerDecorator,
  }) {
    return OnboardingState()
      ..userDetails = userDetails ?? this.userDetails
      ..currentIndex = currentIndex ?? this.currentIndex
      ..isLoading = isLoading ?? this.isLoading
      ..pagerDecorator = pagerDecorator ?? this.pagerDecorator;
  }
}