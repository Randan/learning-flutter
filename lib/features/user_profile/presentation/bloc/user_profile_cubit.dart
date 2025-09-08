import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/features/user_profile/data/data_source/entities/custom_server_error.dart';
import 'package:learning_flutter/features/user_profile/data/repositories/fake_user_repository.dart';
import 'package:learning_flutter/features/user_profile/presentation/bloc/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.repository) : super(UserProfileLoading());

  final FakeUserRepository repository;

  Future<void> loadUserProfile() async {
    emit(UserProfileLoading());

    try {
      final user = await repository.getUserProfile();
      emit(UserProfileLoaded(user));
    } on CustomServerError catch (e) {
      emit(UserProfileCustomServerError(e));
    } catch (e) {
      emit(UserProfileGeneralError(e as Exception));
    }
  }
}
