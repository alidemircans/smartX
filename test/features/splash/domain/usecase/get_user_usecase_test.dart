import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/splash/domain/entity/user.dart';
import 'package:smartx/features/splash/domain/repository/user_repository.dart';
import 'package:smartx/features/splash/domain/usecase/get_user_usecase.dart';

import 'get_user_usecase_test.mocks.dart';

class UserRepositoryTest extends Mock implements UserRepository {}

@GenerateMocks([UserRepositoryTest])
void main() {
  late GetUserUseCase useCase;
  late MockUserRepositoryTest repository;

  setUp(() {
    repository = MockUserRepositoryTest();
    useCase = GetUserUseCase(repository);
  });
  const number = 1;
  const user = User(id: 1, name: "test");
  test("should get for the User form repository", () async {
    when(repository.getUser()).thenAnswer((_) async {
      return Future.value(const Right(user));
    });

    final result = await useCase(const WithOutParams());
    expect(result, const Right(user));
  });
  test("should return a CacheException when no data on shared", () async {
    when(repository.getUser()).thenAnswer((_) async {
      return Future.value(Left(CacheFailure()));
    });

    final result = await useCase(const WithOutParams());
    expect(result, Left(CacheFailure()));
  });
}
