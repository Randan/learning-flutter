import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/bloc_task/bloc/counter_bloc.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/bloc_task/bloc/counter_event.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/bloc_task/bloc/counter_state.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBlock = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) => Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                ElevatedButton(
                  onPressed: () => counterBlock.add(CounterDecrementEvent()),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => counterBlock.add(CounterResetEvent()),
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () => counterBlock.add(CounterIncrementEvent()),
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
