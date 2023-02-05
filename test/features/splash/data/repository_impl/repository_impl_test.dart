import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smartx/features/splash/data/datasource/user_local_data_source.dart';
import 'package:smartx/features/splash/data/model/user_model.dart';
import 'package:smartx/features/splash/data/repository_impl/user_repository_impl.dart';

import 'repository_impl_test.mocks.dart';

class UserLocalDataSourceTest extends Mock implements UserLocalDataSourceImpl {}

@GenerateMocks([UserLocalDataSourceTest])
void main() {
  late UserRepositoryImpl repositoryImpl;
  late MockUserLocalDataSourceTest mockUserLocalDataSource;

  setUp(() {
    mockUserLocalDataSource = MockUserLocalDataSourceTest();
    repositoryImpl = UserRepositoryImpl(
      userLocalDataSource: mockUserLocalDataSource,
    );
  });

  test(
    'should return UserModel when getUser calling',
    () async {
      // arrange
      when(mockUserLocalDataSource.getUser()).thenAnswer(
          (realInvocation) async =>
              Future.value(const UserModel(id: 1, name: "Ali")));
      // act
      final result = await repositoryImpl.getUser();
      // assert

      expect(result, equals(const Right(UserModel(id: 1, name: "Ali"))));
    },
  );
}
