import 'package:flutter/material.dart';
import 'package:my_state_management/my_state_management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Example App',
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StateProvider stateProvider = StateProvider();
    stateProvider.initialize<int>('counter', 0); // Initialize state
    final counterState = stateProvider.getState<int>('counter');

    return Scaffold(
      appBar: AppBar(title: const Text('My Library Example')),
      body: Center(
        child: StreamBuilder<int>(
          stream: counterState?.stream,
          initialData: counterState?.value,
          builder: (context, snapshot) {
            final counter = snapshot.data ?? 0;
            return Text(
              'Counter: $counter',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final currentCounter = counterState?.value ?? 0;
          stateProvider.update<int>('counter', currentCounter + 1); // Update state
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
