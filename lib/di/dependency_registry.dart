import 'package:bloc_demo/core/manager/shared_preferences_manager.dart';
import 'package:bloc_demo/domain/product_repository.dart';
import 'package:bloc_demo/persistence/app_database.dart';
import 'package:bloc_demo/presentation/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';

import '../presentation/onboarding/onboarding/bloc/onboarding_bloc.dart';
import '../remote/user_details_repository.dart';
import '../remote/user_details_service.dart';

final instance = GetIt.instance;

Future<void> init() async {
  final sharedPreferencesManager = await SharedPreferencesManager.create();
  instance.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager);

  instance.registerSingleton<AppDatabase>(AppDatabase());
  instance.registerLazySingleton(() => ProductRepository(instance.get<AppDatabase>()));
  instance.registerLazySingleton(() => UserDetailsService());
  instance.registerLazySingleton(() => UserDetailsRepository(instance.get<UserDetailsService>()));
  instance.registerLazySingleton(() => OnBoardingBloc(instance.get<UserDetailsRepository>(), instance.get<ProductRepository>()));
  instance.registerLazySingleton(() => LoginViewModel(instance.get<ProductRepository>()));
}
