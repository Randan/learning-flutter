import 'package:go_router/go_router.dart';

import 'package:learning_flutter/features/animated_ball/presentation/ui/screens/animated_ball_screen.dart';
import 'package:learning_flutter/features/counter/presentation/ui/screens/counter_bloc_screen.dart';
import 'package:learning_flutter/features/counter/presentation/ui/screens/counter_cubit_screen.dart';
import 'package:learning_flutter/features/custom_widgets/presentation/ui/screens/custom_widgets_screen.dart';
import 'package:learning_flutter/features/network_api/presentation/screens/network_api_screen.dart';
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
          path: 'custom_widgets',
          name: ScreenNames.customWidgets.name,
          builder: (context, state) => const CustomWidgetsScreen(),
        ),
        GoRoute(
          path: 'rating_system',
          name: ScreenNames.ratingSystem.name,
          builder: (context, state) => const RatingSystemScreen(),
        ),
        GoRoute(
          path: 'counter_bloc',
          name: ScreenNames.counterBloc.name,
          builder: (context, state) => const BlocCounterScreen(),
        ),
        GoRoute(
          path: 'counter_cubit',
          name: ScreenNames.counterCubit.name,
          builder: (context, state) => const CubitCounterScreen(),
        ),
        GoRoute(
          path: 'rate_app_cubit',
          name: ScreenNames.rateAppCubit.name,
          builder: (context, state) => const RateAppCubitScreen(),
        ),
        GoRoute(
          path: 'rate_app_bloc',
          name: ScreenNames.rateAppBloc.name,
          builder: (context, state) => const RateAppBlocScreen(),
        ),
        GoRoute(
          path: 'animated_ball',
          name: ScreenNames.animatedBall.name,
          builder: (context, state) => const AnimatedBallScreen(),
        ),
        GoRoute(
          path: 'user_profile',
          name: ScreenNames.userProfile.name,
          builder: (context, state) => const UserProfileHomeworkScreen(),
        ),
        GoRoute(
          path: 'network_api',
          name: ScreenNames.networkApi.name,
          builder: (context, state) => const NetworkApiScreen(),
        ),
      ],
    ),
  ],
);
