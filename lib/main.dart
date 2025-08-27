import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/bloc_task/bloc/counter_bloc.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/cubit_task/cubit/counter_cubit.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/bloc/rate_app_bloc.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/bloc/rate_app_cubit.dart';
import 'package:learning_flutter/features/homeworks/lesson_23/data/repository/fake_user_repository.dart';
import 'package:learning_flutter/features/homeworks/lesson_23/presentation/cubit/user_profile_cubit.dart';
import 'package:learning_flutter/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => RateAppCubit()),
        BlocProvider(create: (context) => RateAppBloc()),
        BlocProvider(
          create: (context) => UserProfileCubit(FakeUserRepository()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
