import 'package:learning_flutter/features/homeworks/lesson_23/data/repository/entity/custom_server_error.dart';
import 'package:learning_flutter/features/homeworks/lesson_23/data/repository/entity/user_entity.dart';

class FakeUserRepository {
  bool _hasFailed = false;

  Future<UserEntity> getUserProfile() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!_hasFailed) {
      _hasFailed = true;
      try {
        throw Exception('Server is temporarily unavailable');
      } catch (e) {
        throw CustomServerError(message: 'Server is temporarily unavailable');
      }
    }
    return UserEntity(id: '1', name: 'Test User');
  }
}
