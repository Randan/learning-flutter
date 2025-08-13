import 'package:go_router/go_router.dart';
import 'package:learning_flutter/features/homeworks/lesson_13/homework_13_screen.dart';
import 'package:learning_flutter/features/homeworks/lesson_14/homework_14_screen.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/bloc_task/bloc_counter_screen.dart';
import 'package:learning_flutter/features/homeworks/lesson_19/cubit_task/cubit_counter_screen.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/presentation/screens/rate_app_bloc_screen.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/presentation/screens/rate_app_cubit_screen.dart';
import 'package:learning_flutter/home_page.dart';
import 'package:learning_flutter/router/screen_names.dart';

final appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'lesson_13',
          name: ScreenNames.lesson13.name,
          builder: (context, state) => const Lesson13(),
        ),
        GoRoute(
          path: 'lesson_14',
          name: ScreenNames.lesson14.name,
          builder: (context, state) => const Lesson14(),
        ),
        GoRoute(
          path: 'lesson_19_bloc',
          name: ScreenNames.lesson19Bloc.name,
          builder: (context, state) => const BlocCounterScreen(),
        ),
        GoRoute(
          path: 'lesson_19_cubit',
          name: ScreenNames.lesson19Cubit.name,
          builder: (context, state) => const CubitCounterScreen(),
        ),
        GoRoute(
          path: 'lesson_20_cubit',
          name: ScreenNames.lesson20Cubit.name,
          builder: (context, state) => const RateAppCubitScreen(),
        ),
        GoRoute(
          path: 'lesson_20_bloc',
          name: ScreenNames.lesson20Bloc.name,
          builder: (context, state) => const RateAppBlocScreen(),
        ),
      ],
    ),
  ],
);
