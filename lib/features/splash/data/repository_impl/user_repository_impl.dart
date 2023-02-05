import 'package:dartz/dartz.dart';
import 'package:smartx/core/error/exceptions.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/splash/data/datasource/user_local_data_source.dart';
import 'package:smartx/features/splash/data/model/user_model.dart';
import 'package:smartx/features/splash/domain/entity/user.dart';
import 'package:smartx/features/splash/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({required this.userLocalDataSource});

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final localData = await userLocalDataSource.getUser();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> cacheUser(UserModel userModel) async {
    try {
      final isOk = await userLocalDataSource.cacheUser(userModel);
      return Right(isOk);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
