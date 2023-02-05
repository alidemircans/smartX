import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smartx/core/base/usecases/usecase.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/splash/domain/entity/user.dart';
import 'package:smartx/features/splash/domain/repository/user_repository.dart';

class GetUserUseCase implements UseCase<User, WithOutParams> {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(params) async {
    return await repository.getUser();
  }
}

class WithOutParams extends Equatable {
  const WithOutParams() : super();

  @override
  List<Object?> get props => [];
}
