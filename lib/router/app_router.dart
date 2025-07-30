import 'package:go_router/go_router.dart';
import 'package:learning_flutter/features/homeworks/lesson_13/homework_13_screen.dart';
import 'package:learning_flutter/features/homeworks/lesson_14/homework_14_screen.dart';
import 'package:learning_flutter/home_page.dart';

final appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: '/lesson_13',
          builder: (context, state) => const Lesson13(),
        ),
        GoRoute(
          path: '/lesson_14',
          builder: (context, state) => const Lesson14(),
        ),
      ],
    ),
  ],
);
