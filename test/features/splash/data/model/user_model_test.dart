import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:smartx/features/splash/data/model/user_model.dart';
import 'package:smartx/features/splash/domain/entity/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const userModel = UserModel(id: 1, name: "Ali");

  group('fromJson', () {
    test("should be a subclass of User Entity", () async {
      // assert
      expect(userModel, isA<User>());
    });
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('user.json'));
        // act
        final result = UserModel.fromJson(jsonMap);
        // assert
        expect(result, userModel);
      },
    );

    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = userModel.toJson();
        // assert
        final expectedJsonMap = {
          "id": 1,
          "name": "Ali",
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
