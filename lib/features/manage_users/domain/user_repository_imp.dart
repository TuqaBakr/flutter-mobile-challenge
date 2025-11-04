import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:unifi_solutions/features/manage_users/domain/user_repository.dart';
import '../../../core/data/data_sources/user_local_data_source.dart';
import '../../../core/domain/error_handler/failures.dart';
import '../../../core/domain/error_handler/repository_handler.dart';
import '../data/data_sources/user_remote_data_source.dart';
import 'entities/user_entity.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final Connectivity connectivity;
  UserRepositoryImpl({ required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, UserEntity>> addUser({
    required String name,
    required String email,
    required String gender,
    required String status,
  }) async {
    try {
      final userModel = await remoteDataSource.addUser(
        name: name,
        email: email,
        gender: gender,
        status: status,
      );
      return Right(userModel.toEntity());
    } on DioException catch (e) {
      final networkExceptions = RepositoryHandler.getDioException(e);
      return Left(RepositoryHandler.getResultFailure(networkExceptions));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> fetchPaginatedUsers({
    required int page,
    required int perPage
  }) async {
    final connectivityResult = await connectivity.checkConnectivity();
    final isOnline = connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);

    if (isOnline) {
      try {
        final userModels = await remoteDataSource.fetchPaginatedUsers(
          page: page,
          perPage: perPage,
        );

        final userEntities = userModels.map((model) => model.toEntity()).toList();

        if (page == 1) {
          await localDataSource.cacheUsers(userEntities);
        }

        return Right(userEntities);
      } catch (e) {
        final failure = e is Failure ? e : const LocalFailure(message: 'Unknown remote error');

        try {
          final cachedUsers = await localDataSource.getCachedUsers();
          if (cachedUsers.isNotEmpty) {
            return Right(cachedUsers);
          }
          return Left(failure);
        } on Exception {
          return Left(LocalFailure(message: 'Failed to access local cache after network failure.'));
        }
      }
    } else {
      try {
        final cachedUsers = await localDataSource.getCachedUsers();
        if (cachedUsers.isEmpty) {
           return const Left(NetworkFailure(message: 'You are offline and no data is cached.'));
        }
        return Right(cachedUsers);
      } catch (e) {
        return const Left(LocalFailure(message: 'Error accessing local cache.'));
      }
    }
  }
}