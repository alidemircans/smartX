import 'package:dartz/dartz.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/devices/data/model/routines_model.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';

abstract class DeviceRepository {
  Future<Either<Failure, bool>> addNewRoutine(int id, RoutineModel routine);
  Future<Either<Failure, List<Device>?>> getAllDevices();
}
