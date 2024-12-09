import 'dart:async';

class ReactiveState<T> {
  T _value;
  final _controller = StreamController<T>.broadcast();

  ReactiveState(this._value);

  /// Get the current state value
  T get value => _value;

  /// Listen to state changes
  Stream<T> get stream => _controller.stream;

  /// Update the state value and notify listeners
  void update(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      _controller.sink.add(_value);
    }
  }

  /// Reset the state to a default value
  void reset(T defaultValue) {
    _value = defaultValue;
    _controller.sink.add(_value);
  }

  /// Dispose the state to avoid memory leaks
  void dispose() {
    _controller.close();
  }
}
