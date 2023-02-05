import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:smartx/features/devices/data/model/device_model.dart';
import 'package:smartx/features/devices/data/model/routines_model.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const deviceModel = DeviceModel(
    id: 6,
    name: "Name",
    description: "Example",
    image: "",
    routines: [
      RoutineModel(name: "Example", description: "Example", whenRun: "Example")
    ],
  );

  group('fromJson', () {
    test("should be a subclass of Device Entity", () async {
      // assert
      expect(deviceModel, isA<Device>());
    });
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('device.json'));
        // act
        final result = DeviceModel.fromJson(jsonMap);
        // assert
        expect(result, deviceModel);
      },
    );

    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = deviceModel.toJson();
        // assert
        final expectedJsonMap = {
          'id': 6,
          'name': 'Name',
          'description': 'Example',
          'image': '',
          'routines': [
            const RoutineModel(
                description: "Example", name: "Example", whenRun: "Example")
          ]
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
