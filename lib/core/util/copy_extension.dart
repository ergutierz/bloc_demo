extension CopyExtension<T> on T {
  T copy({required T Function(T) update}) {
    return update(this);
  }
}