import 'package:bloc_demo/presentation/onboarding/onboarding/effect.dart';
import 'package:bloc_demo/util/one-time-event-builder.dart';
import 'package:bloc_demo/util/one-time-event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class OnBoardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnBoardingBloc() : super(OnboardingState()) {
    on<OnBoardingEventNext>(_handleNextEvent);
    on<OnBoardingEventPrevious>(_handlePreviousEvent,);
    on<OnBoardingEventSkip>(_handleSkipEvent);
    on<OnBoardingEventFinish>(_handleFinishEvent);
    on<OnBoardingEventUpdateIndex>(_handleUpdateIndexEvent);
    on<OnBoardingEventDefault>(_handleDefaultEvent);
    on<OnBoardingEventDispose>(_handleDisposeEvent);
  }

  _handleNextEvent(OnBoardingEventNext event, Emitter<OnboardingState> emit) {
    emit(state.copy(oneTimeEvent: createOneTimeEvent(OnBoardingEffectNext())));
  }

  _handlePreviousEvent(OnBoardingEventPrevious event, Emitter<OnboardingState> emit) {
    emit(state.copy(oneTimeEvent: createOneTimeEvent(OnBoardingEffectPrevious())));
  }

  _handleSkipEvent(OnBoardingEventSkip event, Emitter<OnboardingState> emit) {
    emit(state.copy(oneTimeEvent: createOneTimeEvent(OnBoardingEffectSkip())));
  }

  _handleFinishEvent(OnBoardingEventFinish event, Emitter<OnboardingState> emit) {
    emit(state.copy(oneTimeEvent: createOneTimeEvent(OnBoardingEffectFinish())));
  }

  _handleUpdateIndexEvent(
      OnBoardingEventUpdateIndex event, Emitter<OnboardingState> emit) {
    emit(state.copy(currentIndex: event.index));
  }

  _handleDefaultEvent(OnBoardingEventDefault event, Emitter<OnboardingState> emit) {
    //do nothing
  }

  _handleDisposeEvent(OnBoardingEventDispose event, Emitter<OnboardingState> emit) {
    emit(state.copy(oneTimeEvent: OneTimeEvent(null)));
  }
}

