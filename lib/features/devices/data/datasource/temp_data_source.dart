import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:smartx/core/constants/assets_constants.dart';
import 'package:smartx/core/error/exceptions.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/devices/data/model/device_model.dart';
import 'package:smartx/features/devices/data/model/routines_model.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';

abstract class TempDataSource {
  Future<bool> addNewRoutines(int id, RoutineModel routine);
  Future<List<Device>?> getAllDevices();
}

class TempDataSourceImpl implements TempDataSource {
  List<Device> devices = [];

  @override
  Future<List<Device>?> getAllDevices() async {
    try {
      var str = await rootBundle.loadString(AssetsPath.devicesJson);
      var json = jsonDecode(str);
      if (json != null && json is List) {
        for (var data in json) {
          devices.add(DeviceModel.fromJson(data));
        }
        return devices;
      } else {
        throw AssetException();
      }
    } catch (e) {
      throw UnExpected(e.toString());
    }
  }

  @override
  Future<bool> addNewRoutines(int id, RoutineModel routine) async {
    try {
      for (var device in devices) {
        if (device.id == id) {
          device.routines.add(routine);
        }
      }
      return true;
    } catch (e) {
      throw false;
    }
  }
}
