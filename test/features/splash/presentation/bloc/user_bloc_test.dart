import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smartx/features/splash/domain/usecase/cache_user_usecase.dart';
import 'package:smartx/features/splash/domain/usecase/get_user_usecase.dart';
import 'package:smartx/features/splash/presentation/bloc/user_bloc.dart';

import 'user_bloc_test.mocks.dart';

class UserBlocCacheUserUseCaseTest extends Mock implements CacheUserUseCase {}

class UserBlocGetUserUseCaseTest extends Mock implements GetUserUseCase {}

@GenerateMocks([UserBlocCacheUserUseCaseTest, UserBlocGetUserUseCaseTest])
void main() {
  late UserBloc userBloc;
  MockUserBlocCacheUserUseCaseTest mockUserBlocCacheUserUseCaseTest;
  MockUserBlocGetUserUseCaseTest mockUserBlocGetUserUseCaseTest;

  setUp(() {
    mockUserBlocCacheUserUseCaseTest = MockUserBlocCacheUserUseCaseTest();

    mockUserBlocGetUserUseCaseTest = MockUserBlocGetUserUseCaseTest();
    userBloc = UserBloc(
        cacheUserUseCase: mockUserBlocCacheUserUseCaseTest,
        getUserUseCase: mockUserBlocGetUserUseCaseTest);
  });

  test('initialState should be initial', () {
    // assert
    expect(userBloc.state, equals(const UserState.initial()));
  });
}
