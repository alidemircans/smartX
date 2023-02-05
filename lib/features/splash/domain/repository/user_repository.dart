import 'package:dartz/dartz.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/splash/data/model/user_model.dart';
import 'package:smartx/features/splash/domain/entity/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, bool>> cacheUser(UserModel userModel);
}
