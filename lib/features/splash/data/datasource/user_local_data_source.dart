import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartx/core/constants/cache_constants.dart';
import 'package:smartx/core/error/exceptions.dart';
import 'package:smartx/features/splash/data/model/user_model.dart';
import 'package:smartx/features/splash/domain/entity/user.dart';

abstract class UserLocalDataSource {
  Future<User> getUser();
  Future<bool> cacheUser(UserModel userModel);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> cacheUser(UserModel exampleModel) {
    return sharedPreferences.setString(
        CacheConstants.USER_CACHE_DATA, json.encode(exampleModel.toJson()));
  }

  @override
  Future<UserModel> getUser() async {
    final jsonString =
        sharedPreferences.getString(CacheConstants.USER_CACHE_DATA);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
