import 'package:bloc_demo/presentation/onboarding/onboarding/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerLazySingleton(() => OnBoardingBloc());
}
