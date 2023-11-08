import 'dart:async';

import 'package:bloc_demo/presentation/onboarding/onboarding/effect.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class OnBoardingBloc extends Bloc<OnboardingEvent, OnboardingState> {

  final _events = StreamController.broadcast();
  Stream<OnBoardingEffect> get events => _events.stream.map((event) => event);

  OnBoardingBloc() : super(OnboardingState()) {
    on<OnBoardingEventNext>(_handleNextEvent);
    on<OnBoardingEventPrevious>(_handlePreviousEvent,);
    on<OnBoardingEventSkip>(_handleSkipEvent);
    on<OnBoardingEventFinish>(_handleFinishEvent);
    on<OnBoardingEventUpdateIndex>(_handleUpdateIndexEvent);
    on<OnBoardingEventDefault>((event, emit) => {});
  }

  _handleNextEvent(OnBoardingEventNext event, Emitter<OnboardingState> emit) {
    _events.add(OnBoardingEffectNext());
  }

  _handlePreviousEvent(OnBoardingEventPrevious event, Emitter<OnboardingState> emit) {
    _events.add(OnBoardingEffectPrevious());
  }

  _handleSkipEvent(OnBoardingEventSkip event, Emitter<OnboardingState> emit) {
    _events.add(OnBoardingEffectSkip());
  }

  _handleFinishEvent(OnBoardingEventFinish event, Emitter<OnboardingState> emit) {
    _events.add(OnBoardingEffectFinish());
  }

  _handleUpdateIndexEvent(OnBoardingEventUpdateIndex event, Emitter<OnboardingState> emit) {
    emit(state.copy(currentIndex: event.index));
  }
}

