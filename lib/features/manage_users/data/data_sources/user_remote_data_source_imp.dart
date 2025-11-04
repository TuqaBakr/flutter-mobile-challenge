import 'package:dio/dio.dart';
import 'package:unifi_solutions/features/manage_users/data/data_sources/user_remote_data_source.dart';
import '../../../../core/data/models/user_model.dart';
import 'end_points.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio ;

  UserRemoteDataSourceImpl({required this.dio});


  @override
  Future<List<UserModel>> fetchPaginatedUsers({
    required int page,
    required int perPage,
  }) async {
    try {
      final response = await dio.get('/users', queryParameters: {
        'page': page,
        'per_page': perPage,
      });

      if (response.data is List) {
        final List<dynamic> jsonList = response.data as List<dynamic>;

        return jsonList.map((json) => UserModel.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw DioException.badResponse(
          statusCode: 200,
          requestOptions: response.requestOptions,
          response: response,
        );
      }

    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw DioException(
          requestOptions: RequestOptions(path: '/users'),
          type: DioExceptionType.unknown,
          error: 'Parsing Error: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> addUser({
    required String name,
    required String email,
    required String gender,
    required String status,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.users,
        data: {
          'name': name,
          'email': email,
          'gender': gender,
          'status': status,
        },
      );

      if (response.statusCode == 201) {
         return UserModel.fromJson(response.data as Map<String, dynamic>);
      }

      throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse
      );

    } on DioException {
      rethrow;
    }
  }
}