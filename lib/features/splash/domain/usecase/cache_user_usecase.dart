import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smartx/core/base/usecases/usecase.dart';
import 'package:smartx/core/error/exceptions.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/splash/data/model/user_model.dart';
import 'package:smartx/features/splash/domain/repository/user_repository.dart';

class CacheUserUseCase implements UseCase<bool, Params> {
  final UserRepository repository;

  CacheUserUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    try {
      final cacheUserEither = await repository.cacheUser(params.userModel);
      return cacheUserEither.fold(
          (l) => Left(CacheFailure()), (r) => const Right(true));
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}

class Params extends Equatable {
  UserModel userModel;
  Params({required this.userModel}) : super();

  @override
  List<Object?> get props => [userModel];
}
