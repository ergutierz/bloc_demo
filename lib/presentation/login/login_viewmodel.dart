import '../../util/state_modelstore.dart';

class LoginViewModel {
  final StateModelStore<LoginViewState, LoginEvent> modelStore =
  StateModelStore<LoginViewState, LoginEvent>(LoginViewState());

  onIntent(LoginIntent intent) {
    switch(intent) {

    }
  }
}

sealed class LoginIntent {}

sealed class LoginEvent {}

class LoginViewState {
  int currentIndex = 0;
  bool isLoading = false;
}