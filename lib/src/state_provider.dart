import 'reactive_state.dart';

class StateProvider {
  final Map<String, ReactiveState<dynamic>> _states = {};

  /// Initialize a new state with a default value
  void initialize<T>(String key, T defaultValue) {
    if (!_states.containsKey(key)) {
      _states[key] = ReactiveState<T>(defaultValue);
    }
  }

  /// Get the state by key
  ReactiveState<T>? getState<T>(String key) {
    return _states[key] as ReactiveState<T>?;
  }

  /// Update a specific state
  void update<T>(String key, T value) {
    final state = _states[key];
    if (state is ReactiveState<T>) {
      state.update(value);
    }
  }

  /// Reset a specific state
  void reset(String key, dynamic defaultValue) {
    final state = _states[key];
    if (state != null) {
      state.reset(defaultValue);
    }
  }

  /// Dispose all states
  void disposeAll() {
    for (var state in _states.values) {
      state.dispose();
    }
    _states.clear();
  }
}
