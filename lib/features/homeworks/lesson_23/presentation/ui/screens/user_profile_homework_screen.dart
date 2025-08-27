import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/features/homeworks/lesson_23/data/repository/entity/custom_server_error.dart';
import 'package:learning_flutter/features/homeworks/lesson_23/data/repository/entity/user_entity.dart';
import 'package:learning_flutter/features/homeworks/lesson_23/presentation/cubit/user_profile_cubit.dart';
import 'package:learning_flutter/features/homeworks/lesson_23/presentation/cubit/user_profile_state.dart';

class UserProfileHomeworkScreen extends StatefulWidget {
  const UserProfileHomeworkScreen({super.key});

  @override
  State<UserProfileHomeworkScreen> createState() =>
      _UserProfileHomeworkScreenState();
}

class _UserProfileHomeworkScreenState extends State<UserProfileHomeworkScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserProfileCubit>().loadUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile Homework')),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          return switch (state) {
            //Loading State
            UserProfileLoading() => const Center(
              child: CircularProgressIndicator(),
            ),

            //Loaded State
            UserProfileLoaded() => _LoadedProfileWidget(user: state.user),

            //Custom Server Error State
            UserProfileCustomServerError() => _CustomServerErrorWidget(
              error: state.error,
              onRetry: () => context.read<UserProfileCubit>().loadUserProfile(),
            ),

            //General Error State
            UserProfileGeneralError() => _GeneralErrorWidget(
              error: state.error,
              onRetry: () => context.read<UserProfileCubit>().loadUserProfile(),
            ),
          };
        },
      ),
    );
  }
}

class _LoadedProfileWidget extends StatelessWidget {
  const _LoadedProfileWidget({required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text('ID: ${user.id}'),
                const SizedBox(height: 16),
                const Text(
                  'Профіль успішно завантажено!',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomServerErrorWidget extends StatelessWidget {
  const _CustomServerErrorWidget({required this.error, required this.onRetry});

  final CustomServerError error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          color: Colors.red.shade50,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Помилка сервера',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  error.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Спробувати знову'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GeneralErrorWidget extends StatelessWidget {
  const _GeneralErrorWidget({required this.error, required this.onRetry});

  final Exception error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          color: Colors.orange.shade50,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.warning_amber, size: 64, color: Colors.orange),
                const SizedBox(height: 16),
                const Text(
                  'Загальна помилка',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Спробувати знову'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
