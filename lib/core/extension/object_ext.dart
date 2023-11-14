extension OrElse<T> on T? {
  T orElse(T Function() defaultValueProvider) {
    return this ?? defaultValueProvider();
  }
}
