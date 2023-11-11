import 'package:alice/alice.dart';
import 'package:bloc_demo/core/manager/shared_preferences_manager.dart';
import 'package:bloc_demo/domain/product_repository.dart';
import 'package:bloc_demo/persistence/app_database.dart';
import 'package:bloc_demo/presentation/login/login_viewmodel.dart';
import 'package:bloc_demo/remote/user_details_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../presentation/onboarding/onboarding/bloc/onboarding_bloc.dart';
import '../remote/user_details_repository.dart';
import '../remote/user_details_service.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerSingleton<Alice>(Alice(showNotification: !kReleaseMode));
  instance.registerSingleton<AppDatabase>(AppDatabase());

  final sharedPreferencesManager = await SharedPreferencesManager.create();
  instance.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager);

  final dio = _dioConfiguration();
  instance.registerSingleton<Dio>(dio);

  instance.registerLazySingleton(() => UserDetailsApi(instance.get<Dio>()));
  instance.registerLazySingleton(() => ProductRepository(instance.get<AppDatabase>()));
  instance.registerLazySingleton(() => UserDetailsService(instance.get<UserDetailsApi>()));
  instance.registerLazySingleton(() => UserDetailsRepository(instance.get<UserDetailsService>()));
  instance.registerLazySingleton(() => OnBoardingBloc(instance.get<UserDetailsRepository>(), instance.get<ProductRepository>()));
  instance.registerLazySingleton(() => LoginViewModel(instance.get<ProductRepository>()));
}

Dio _dioConfiguration() {
  final dio = Dio();
  dio.interceptors.add(instance.get<Alice>().getDioInterceptor());
  dio.interceptors.add(LogInterceptor(
    responseBody: !kReleaseMode,
    requestBody: !kReleaseMode,
    error: !kReleaseMode,
    requestHeader: !kReleaseMode,
    responseHeader: !kReleaseMode,
  ));

  dio.options.headers = { 'Content-Type': 'application/json' };
  dio.options.responseType = ResponseType.json;
  return dio;
}
