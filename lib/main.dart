import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learning_flutter/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:learning_flutter/features/counter/presentation/bloc/counter_cubit.dart';
import 'package:learning_flutter/features/rate_app/presentation/bloc/rate_app_bloc.dart';
import 'package:learning_flutter/features/rate_app/presentation/bloc/rate_app_cubit.dart';
import 'package:learning_flutter/features/user_profile/data/repositories/fake_user_repository.dart';
import 'package:learning_flutter/features/user_profile/presentation/bloc/user_profile_cubit.dart';
import 'package:learning_flutter/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    print('Warning: .env file not found: $e');
  }
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
