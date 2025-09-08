import 'package:go_router/go_router.dart';

import 'package:learning_flutter/features/animated_ball/presentation/ui/screens/animated_ball_screen.dart';
import 'package:learning_flutter/features/counter/presentation/ui/screens/counter_bloc_screen.dart';
import 'package:learning_flutter/features/counter/presentation/ui/screens/counter_cubit_screen.dart';
import 'package:learning_flutter/features/custom_widgets/presentation/ui/screens/custom_widgets_screen.dart';
import 'package:learning_flutter/features/rate_app/presentation/ui/screens/rate_app_bloc_screen.dart';
import 'package:learning_flutter/features/rate_app/presentation/ui/screens/rate_app_cubit_screen.dart';
import 'package:learning_flutter/features/rating_system/presentation/ui/screens/rating_system_screen.dart';
import 'package:learning_flutter/features/user_profile/presentation/ui/screens/user_profile_homework_screen.dart';
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
        GoRoute(
          path: 'lesson_22',
          name: ScreenNames.lesson22.name,
          builder: (context, state) => const HomeworkLesson22(),
        ),
        GoRoute(
          path: 'lesson_23',
          name: ScreenNames.lesson23.name,
          builder: (context, state) => const UserProfileHomeworkScreen(),
        ),
      ],
    ),
  ],
);
