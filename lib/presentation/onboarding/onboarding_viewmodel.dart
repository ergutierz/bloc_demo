import 'package:bloc_demo/presentation/onboarding/onboarding_pager_decorator.dart';

import '../../util/state_modelstore.dart';

class OnBoardingViewModel {
  final StateModelStore<OnBoardingViewState, OnBoardingEvent> modelStore =
  StateModelStore<OnBoardingViewState, OnBoardingEvent>(OnBoardingViewState());

  onIntent(OnBoardingIntent intent) {
    switch(intent) {
      case OnBoardingIntentStart(): _onBoardingIntentStart();
      case OnBoardingIntentNext(): _onBoardingIntentNext();
      case OnBoardingIntentPrevious(): _onBoardingIntentPrevious();
      case OnBoardingIntentSkip(): _onBoardingIntentSkip();
      case OnBoardingIntentFinish(): _onBoardingIntentFinish();
      case OnBoardingIntentUpdateIndex(): _onBoardingIntentUpdateIndex(index: intent.index);
      case OnBoardingIntentDispose(): _dispose();
    }
  }

  _onBoardingIntentStart() {
    modelStore.processEvent(OnBoardingEventStart());
  }

  _onBoardingIntentNext() {
    modelStore.processEvent(OnBoardingEventNext());
  }

  _onBoardingIntentPrevious() {
    modelStore.processEvent(OnBoardingEventPrevious());
  }

  _onBoardingIntentSkip() {
    modelStore.processEvent(OnBoardingEventSkip());
  }

  _onBoardingIntentFinish() {
    modelStore.processEvent(OnBoardingEventFinish());
  }

  _onBoardingIntentUpdateIndex({required int index}) {
    modelStore.processState((oldState) => oldState.copy(currentIndex: index));
  }

  _dispose() {
    modelStore.dispose();
  }
}

sealed class OnBoardingIntent {}
class OnBoardingIntentStart extends OnBoardingIntent {}
class OnBoardingIntentNext extends OnBoardingIntent {}
class OnBoardingIntentPrevious extends OnBoardingIntent {}
class OnBoardingIntentSkip extends OnBoardingIntent {}
class OnBoardingIntentFinish extends OnBoardingIntent {}
class OnBoardingIntentDispose extends OnBoardingIntent {}
class OnBoardingIntentUpdateIndex extends OnBoardingIntent {
  final int index;
  OnBoardingIntentUpdateIndex({required this.index});
}

sealed class OnBoardingEvent {}
class OnBoardingEventStart extends OnBoardingEvent {}
class OnBoardingEventNext extends OnBoardingEvent {}
class OnBoardingEventPrevious extends OnBoardingEvent {}
class OnBoardingEventSkip extends OnBoardingEvent {}
class OnBoardingEventFinish extends OnBoardingEvent {}

class OnBoardingViewState {
  int currentIndex = 0;
  bool isLoading = false;
  OnBoardingPagerDecorator pagerDecorator = OnBoardingPagerDecorator().decorate();

  OnBoardingViewState copy({
    int? currentIndex,
    bool? isLoading,
    OnBoardingPagerDecorator? pagerDecorator,
  }) {
    return OnBoardingViewState()
      ..currentIndex = currentIndex ?? this.currentIndex
      ..isLoading = isLoading ?? this.isLoading
      ..pagerDecorator = pagerDecorator ?? this.pagerDecorator;
  }
}
