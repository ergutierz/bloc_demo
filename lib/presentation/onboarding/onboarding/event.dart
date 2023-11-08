abstract class OnboardingEvent {}

class OnBoardingEventDefault extends OnboardingEvent {}
class OnBoardingEventNext extends OnboardingEvent {}
class OnBoardingEventPrevious extends OnboardingEvent {}
class OnBoardingEventSkip extends OnboardingEvent {}
class OnBoardingEventFinish extends OnboardingEvent {}
class OnBoardingEventUpdateIndex extends OnboardingEvent {
  final int index;
  OnBoardingEventUpdateIndex({required this.index});
}
class OnBoardingEventDispose extends OnboardingEvent {}