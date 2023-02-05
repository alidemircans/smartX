import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartx/core/constants/cache_constants.dart';
import 'package:smartx/features/splash/data/datasource/user_local_data_source.dart';
import 'package:smartx/features/splash/data/model/user_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'user_local_data_source_test.mocks.dart';

class SharedPreferencesTest extends Mock implements SharedPreferences {}

@GenerateMocks([SharedPreferencesTest])
void main() {
  late UserLocalDataSourceImpl userLocalDataSourceImpl;
  late MockSharedPreferencesTest mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferencesTest();
    userLocalDataSourceImpl = UserLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('get User', () {
    final tUserModel = UserModel.fromJson(json.decode(fixture('user.json')));

    test(
      'should return UserModel from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(CacheConstants.USER_CACHE_DATA))
            .thenReturn(fixture('user.json'));
        // act
        final result = await userLocalDataSourceImpl.getUser();
        // assert
        verify(mockSharedPreferences.getString(CacheConstants.USER_CACHE_DATA));
        expect(result, equals(tUserModel));
      },
    );
  });

  test('should call SharedPreferences to cache the data', () async {
    const user = UserModel(id: 1, name: "Ali");
    final expectedJsonString = json.encode(user.toJson());

    when(mockSharedPreferences.setString(
            CacheConstants.USER_CACHE_DATA, expectedJsonString))
        .thenAnswer((_) => Future.value(true));
    // act
    final bool isOk = await userLocalDataSourceImpl.cacheUser(user);
    // assert

    expect(isOk, true);
  });
}
