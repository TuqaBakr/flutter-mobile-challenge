import '../../../../core/data/models/user_model.dart';

abstract class UserRemoteDataSource{

  Future<List<UserModel>> fetchPaginatedUsers({
    required int page,
    required int perPage,
  });

  Future<UserModel> addUser({
    required String name,
    required String email,
    required String gender,
    required String status,
  });
}
