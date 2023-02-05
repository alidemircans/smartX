import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/splash/data/model/user_model.dart';
import 'package:smartx/features/splash/domain/repository/user_repository.dart';
import 'package:smartx/features/splash/domain/usecase/cache_user_usecase.dart';

import 'cache_user_usecase_test.mocks.dart';

class UserRepositoryTest extends Mock implements UserRepository {}

@GenerateMocks([UserRepositoryTest])
void main() {
  late CacheUserUseCase useCase;
  late MockUserRepositoryTest repository;

  setUp(() {
    repository = MockUserRepositoryTest();
    useCase = CacheUserUseCase(repository);
  });

  const user = UserModel(id: 1, name: "test");
  test("should cache the User form repository", () async {
    when(repository.cacheUser(user))
        .thenAnswer((realInvocation) => Future.value(const Right(true)));

    final result = await useCase(Params(userModel: user));
    expect(result, const Right(true));
  });

  test("should return a failure when has some error", () async {
    when(repository.cacheUser(user))
        .thenAnswer((realInvocation) => Future.value(Left(CacheFailure())));

    final result = await useCase(Params(userModel: user));
    expect(result, Left(CacheFailure()));
  });
}
