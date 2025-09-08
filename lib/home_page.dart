import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:learning_flutter/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:learning_flutter/features/counter/presentation/bloc/counter_cubit.dart';
import 'package:learning_flutter/features/counter/presentation/bloc/counter_cubit_state.dart';
import 'package:learning_flutter/features/counter/presentation/bloc/counter_state.dart';
import 'package:learning_flutter/router/screen_names.dart';
import 'package:learning_flutter/shared/widgets/feature_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      title: const Text('robot-dreams-code homeworks'),
    ),
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FeatureCard(
              title: 'Dart homeworks in another project...',
              onTap: null,
            ),
            FeatureCard(
              title: 'L 13: Widgets pt.1',
              onTap: () {
                context.goNamed(ScreenNames.lesson13.name);
              },
            ),
            FeatureCard(
              title: 'L 14: Widgets pt.2',
              onTap: () {
                context.goNamed(ScreenNames.lesson14.name);
              },
            ),
            FeatureCard(title: 'L 15: Widgets composition', onTap: null),
            FeatureCard(title: 'L 16: Navigation Basics', onTap: null),
            FeatureCard(title: 'L 17: Popular packages of Nav', onTap: null),
            BlocBuilder<CounterCubit, CounterCubitState>(
              builder: (context, state) => FeatureCard(
                title: 'L 19: Cubit (${state.counter})',
                onTap: () {
                  context.goNamed(ScreenNames.lesson19Cubit.name);
                },
              ),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) => FeatureCard(
                title: 'L 19: Bloc (${state.counter})',
                onTap: () {
                  context.goNamed(ScreenNames.lesson19Bloc.name);
                },
              ),
            ),
            FeatureCard(
              title: 'L 20: Rate App Cubit',
              onTap: () {
                context.goNamed(ScreenNames.lesson20Cubit.name);
              },
            ),
            FeatureCard(
              title: 'L 20: Rate App BLoC',
              onTap: () {
                context.goNamed(ScreenNames.lesson20Bloc.name);
              },
            ),
            FeatureCard(
              title: 'L 22: Animated Ball',
              onTap: () {
                context.goNamed(ScreenNames.lesson22.name);
              },
            ),
            FeatureCard(
              title: 'L 23: Error Handling',
              onTap: () {
                context.goNamed(ScreenNames.lesson23.name);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
