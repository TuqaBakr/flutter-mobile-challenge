import 'package:hive_flutter/hive_flutter.dart';
import '../../../features/manage_users/domain/entities/user_entity.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUsers(List<UserEntity> users);
  Future<List<UserEntity>> getCachedUsers();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  static const String _userBoxName = 'userBox';

  @override
  Future<void> cacheUsers(List<UserEntity> users) async {
    final box = await Hive.openBox<UserModel>(_userBoxName);
    await box.clear();

    final userModels = users.map((e) => UserModel.fromEntity(e)).toList();

     for (final userModel in userModels) {
      await box.put(userModel.id.toString(), userModel);
    }
  }

  @override
  Future<List<UserEntity>> getCachedUsers() async {
    final box = await Hive.openBox<UserModel>(_userBoxName);
    return box.values.toList();
  }
}
