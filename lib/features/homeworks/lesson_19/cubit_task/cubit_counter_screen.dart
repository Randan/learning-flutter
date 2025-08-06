import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/cubit_task/cubit/counter_cubit.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/cubit_task/cubit/counter_state.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cubit Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            BlocBuilder<CounterCubit, CounterCubitState>(
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
                  onPressed: counterCubit.decrement,
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: counterCubit.reset,
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: counterCubit.increment,
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
