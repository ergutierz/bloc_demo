import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_demo/domain/product_repository.dart';
import 'package:bloc_demo/remote/user_details_repository.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../persistence/app_database.dart';
import 'onboarding_effect.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final UserDetailsRepository _userDetailsRepository;
  final ProductRepository _productRepository;

  final _events = StreamController.broadcast();

  Stream<OnBoardingEffect> get events => _events.stream.map((event) => event);

  OnBoardingBloc(this._userDetailsRepository, this._productRepository)
      : super(OnboardingState()) {
    on<OnBoardingEventNext>(_handleNextEvent);
    on<OnBoardingEventPrevious>(_handlePreviousEvent,);
    on<OnBoardingEventSkip>(_handleSkipEvent);
    on<OnBoardingEventFinish>(_handleFinishEvent);
    on<OnBoardingEventUpdateIndex>(_handleUpdateIndexEvent);
    on<OnBoardingEventFetchProducts>(_handleFetchProductsEvent);
    on<OnBoardingEventDefault>((event, emit) => _fetchUserDetails(emit));
  }

  _handleNextEvent(OnBoardingEventNext event, Emitter<OnboardingState> emit) {
    _events.add(OnBoardingEffectNext());
  }

  _handlePreviousEvent(
      OnBoardingEventPrevious event, Emitter<OnboardingState> emit) {
    _events.add(OnBoardingEffectPrevious());
  }

  _handleSkipEvent(OnBoardingEventSkip event, Emitter<OnboardingState> emit) {
    _events.add(OnBoardingEffectSkip());
  }

  _handleFinishEvent(
      OnBoardingEventFinish event, Emitter<OnboardingState> emit) {
    _events.add(OnBoardingEffectFinish());
  }

  _handleUpdateIndexEvent(
      OnBoardingEventUpdateIndex event, Emitter<OnboardingState> emit) {
    emit(state.copy(currentIndex: event.index));
  }

  _handleFetchProductsEvent(
      OnBoardingEventFetchProducts event, Emitter<OnboardingState> emit) async {
    var products = await _productRepository.getProducts();
    var endState = products;
  }

  Future<void> _fetchUserDetails(Emitter<OnboardingState> emit) async {
    _onFetchUserData();
  }

  _onFetchUserData() {
    _userDetailsRepository.fetchUserDetails().listen((userDetails) {
        if (userDetails != null) {
          var x = userDetails;
        } else {
          var x = userDetails;
        }
      },
      onError: (error) {
        if (kDebugMode) {
          print('Error: $error');
        }
      },
    );
  }

  Future<void> _addDummyProducts() async {
    final List<ProductCompanion> products = List.generate(20, (index) {
      return ProductCompanion(
        title: Value('Product ${index + 1}'),
        description: Value('Description for product ${index + 1}'),
      );
    });

    await _productRepository.insertProducts(products);
  }
}
