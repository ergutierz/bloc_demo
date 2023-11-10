
class OneTimeEvent<T> {
  late T? _value;
  bool _isConsumed = false;

  OneTimeEvent(this._value);

  T? get value {
    if (_isConsumed) {
      return null;
    } else {
      _isConsumed = true;
      return _value;
    }
  }

  void clear() {
    _value = null;
    _isConsumed = false;
  }
}

