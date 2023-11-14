import '../../core/util/state_modelstore.dart';
import '../../domain/product_repository.dart';

class LoginViewModel {
  final StateModelStore<LoginViewState, LoginEvent> modelStore =
  StateModelStore<LoginViewState, LoginEvent>(LoginViewState());

  final ProductRepository _productRepository;

  LoginViewModel(this._productRepository);

  onIntent(LoginIntent intent) {
    switch(intent) {
      case FetchProducts(): _fetchProducts();
    }
  }

  _fetchProducts() async {
    var products = await _productRepository.getProducts();
    var endState = products;
  }
}

sealed class LoginIntent {}
class FetchProducts extends LoginIntent {}

sealed class LoginEvent {}

class LoginViewState {
  int currentIndex = 0;
  bool isLoading = false;
}