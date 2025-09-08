import 'package:learning_flutter/features/user_profile/data/data_source/entities/custom_server_error.dart';
import 'package:learning_flutter/features/user_profile/data/data_source/entities/user_entity.dart';

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
