import 'package:dio/dio.dart';
import 'package:unifi_solutions/core/data/models/base_model.dart';
import 'package:unifi_solutions/core/data/models/base_response_model.dart';
import 'package:unifi_solutions/core/domain/services/RemoteDataSource.dart';
import 'package:unifi_solutions/features/manage_users/data/data_sources/user_remote_data_source.dart';
import '../../../../core/data/models/user_model.dart';
import '../../../../core/domain/error_handler/exceptions.dart';
import 'end_points.dart';

// class UserRemoteDataSourceImpl implements UserRemoteDataSource {
//   final Dio dio ;
//
//   UserRemoteDataSourceImpl({required this.dio});
//
//
//   @override
//   Future<List<UserModel>> fetchPaginatedUsers({
//     required int page,
//     required int perPage,
//   }) async {
//     try {
//       final response = await dio.get('/users', queryParameters: {
//         'page': page,
//         'per_page': perPage,
//       });
//
//       if (response.data is List) {
//         final List<dynamic> jsonList = response.data as List<dynamic>;
//
//         return jsonList.map((json) => UserModel.fromJson(json as Map<String, dynamic>)).toList();
//       } else {
//         throw DioException.badResponse(
//           statusCode: 200,
//           requestOptions: response.requestOptions,
//           response: response,
//         );
//       }
//
//     } on DioException catch (e) {
//       rethrow;
//     } catch (e) {
//       throw DioException(
//           requestOptions: RequestOptions(path: '/users'),
//           type: DioExceptionType.unknown,
//           error: 'Parsing Error: ${e.toString()}');
//     }
//   }
//
//   @override
//   Future<UserModel> addUser({
//     required String name,
//     required String email,
//     required String gender,
//     required String status,
//   }) async {
//     try {
//       final response = await dio.post(
//         ApiEndpoints.users,
//         data: {
//           'name': name,
//           'email': email,
//           'gender': gender,
//           'status': status,
//         },
//       );
//
//       if (response.statusCode == 201) {
//          return UserModel.fromJson(response.data as Map<String, dynamic>);
//       }
//
//       throw DioException(
//           requestOptions: response.requestOptions,
//           response: response,
//           type: DioExceptionType.badResponse
//       );
//
//     } on DioException {
//       rethrow;
//     }
//   }
// }

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final RemoteDataSource remoteDataSource;

  UserRemoteDataSourceImpl({required this.remoteDataSource});

  @override
  Future<BaseModels> fetchPaginatedUsers2(
      {required int page, required int perPage}) async {
    try {
      final BaseResponseModel responseModel =
          await remoteDataSource.get(ApiEndpoints.users, queryParams: {
        'page': page,
        'per_page': perPage,
      });

      if (responseModel.body is List) {
        return BaseModels.fromJson(
          responseModel.body,
          (json) => UserModel.fromJson(json as Map<String, dynamic>),
        );
      }

      throw Exception('Unexpected API response format for user list.');
    } on DioException {
      rethrow;
    } catch (e) {
      throw DioException(
          requestOptions: RequestOptions(path: ApiEndpoints.users),
          type: DioExceptionType.unknown,
          error: 'Parsing Error: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> addUser({required String name, required String email, required String gender, required String status})async {
    try{
      final body = {
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      };

      final BaseResponseModel response = await remoteDataSource.post(
        'users',
        body: body,
      );

      final dynamic responseBody = response.body;
      if (responseBody is List && responseBody.isNotEmpty) {
        final firstError = responseBody.first;
        if (firstError is Map && firstError.containsKey('field') && firstError.containsKey('message')) {

          if (firstError['field'] == 'email' && firstError['message'] == 'has already been taken') {
              throw const DuplicateEmailException(message: 'البريد الإلكتروني مسجل بالفعل.');
          }


          throw ServerException(message: 'خطأ في إدخال البيانات: ${firstError['message']}');
        }
      }

      if (responseBody is Map<String, dynamic>) {
        return UserModel.fromJson(responseBody); //BaseModel.fromJson(response.body, (json)=>UserModel.fromJson(json));
      }
      throw Exception('User addition failed: server response is unexpected.');

    }on DuplicateEmailException {
      rethrow;
    }
    catch(e){
      throw Exception('An error occurred connecting to the server during the add-on.');
    }
    }


}
