import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/bloc_task/bloc/counter_bloc.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/bloc_task/bloc/counter_state.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/cubit_task/cubit/counter_cubit.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/cubit_task/cubit/counter_state.dart';
import 'package:learning_flutter/router/screen_names.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      title: const Text('robot-dreams-code homeworks'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('.....'),
          Text('...Dart homeworks in another project...'),
          ElevatedButton(
            child: const Text('Lesson 13: Widgets pt.1'),
            onPressed: () {
              context.goNamed(ScreenNames.lesson13.name);
            },
          ),
          ElevatedButton(
            child: const Text('Lesson 14: Widgets pt.2'),
            onPressed: () {
              context.goNamed(ScreenNames.lesson14.name);
            },
          ),
          Text('Lesson 15: Widgets composition (w/o h/w)'),
          Text('Lesson 16: Navigation Basics (w/o h/w)'),
          Text('Lesson 17: Popular packages of Nav (w/o visible h/w)'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              BlocBuilder<CounterCubit, CounterCubitState>(
                builder: (context, state) => ElevatedButton(
                  child: Text('Lesson 19: Cubit (${state.counter})'),
                  onPressed: () {
                    context.goNamed(ScreenNames.lesson19Cubit.name);
                  },
                ),
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) => ElevatedButton(
                  child: Text('Lesson 19: Bloc (${state.counter})'),
                  onPressed: () {
                    context.goNamed(ScreenNames.lesson19Bloc.name);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              ElevatedButton(
                child: const Text('L 20: Rate App Cubit'),
                onPressed: () {
                  context.goNamed(ScreenNames.lesson20Cubit.name);
                },
              ),
              ElevatedButton(
                child: const Text('L 20: Rate App BLoC'),
                onPressed: () {
                  context.goNamed(ScreenNames.lesson20Bloc.name);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
