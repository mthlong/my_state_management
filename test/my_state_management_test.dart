import 'package:flutter_test/flutter_test.dart';

import 'package:my_state_management/my_state_management.dart';

void main() {
  test('ReactiveState should update correctly', () {
    final state = ReactiveState<int>(0);
    state.update(1);
    expect(state.value, 1);
  });

  test('StateProvider should initialize and update state correctly', () {
    final stateProvider = StateProvider();
    stateProvider.initialize<int>('counter', 0);
    final counterState = stateProvider.getState<int>('counter');
    expect(counterState?.value, 0);

    stateProvider.update<int>('counter', 5);
    expect(counterState?.value, 5);
  });
}
