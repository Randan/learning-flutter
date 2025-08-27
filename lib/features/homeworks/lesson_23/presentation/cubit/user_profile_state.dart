import 'package:learning_flutter/features/homeworks/lesson_23/data/repository/entity/custom_server_error.dart';
import 'package:learning_flutter/features/homeworks/lesson_23/data/repository/entity/user_entity.dart';

sealed class UserProfileState {}

final class UserProfileLoading implements UserProfileState {}

final class UserProfileLoaded implements UserProfileState {
  UserProfileLoaded(this.user);

  final UserEntity user;
}

final class UserProfileCustomServerError implements UserProfileState {
  UserProfileCustomServerError(this.error);

  final CustomServerError error;
}

final class UserProfileGeneralError implements UserProfileState {
  UserProfileGeneralError(this.error);

  final Exception error;
}
