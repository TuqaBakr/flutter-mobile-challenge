import 'package:unifi_solutions/core/data/models/user_model.dart';

import '../../../../core/data/models/base_model.dart';

abstract class UserRemoteDataSource{

  Future<BaseModels> fetchPaginatedUsers2({
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
