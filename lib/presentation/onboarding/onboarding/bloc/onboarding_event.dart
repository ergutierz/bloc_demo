abstract class OnboardingEvent {}

class OnBoardingEventDefault extends OnboardingEvent {
  // this isn't always used, can be skipped
}
class OnBoardingEventNext extends OnboardingEvent {}
class OnBoardingEventPrevious extends OnboardingEvent {}
class OnBoardingEventSkip extends OnboardingEvent {}
class OnBoardingEventFinish extends OnboardingEvent {}
class OnBoardingEventUpdateIndex extends OnboardingEvent {
  final int index;
  OnBoardingEventUpdateIndex({required this.index});
}
class OnBoardingEventFetchProducts extends OnboardingEvent {}
class OnBoardingEventDispose extends OnboardingEvent {}