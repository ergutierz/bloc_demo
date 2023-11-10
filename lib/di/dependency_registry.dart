import 'package:bloc_demo/core/manager/shared_preferences_manager.dart';
import 'package:bloc_demo/presentation/onboarding/onboarding/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../remote/user_details_repository.dart';
import '../remote/user_details_service.dart';

final instance = GetIt.instance;

Future<void> init() async {
  final sharedPreferencesManager = await SharedPreferencesManager.create();
  instance.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager);

  instance.registerLazySingleton(() => UserDetailsService());
  instance.registerLazySingleton(() => UserDetailsRepository(instance.get<UserDetailsService>()));
  instance.registerLazySingleton(() => OnBoardingBloc(instance.get<UserDetailsRepository>()));
}
