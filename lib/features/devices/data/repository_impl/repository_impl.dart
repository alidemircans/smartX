import 'package:dartz/dartz.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/devices/data/datasource/temp_data_source.dart';
import 'package:smartx/features/devices/data/model/routines_model.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';
import 'package:smartx/features/devices/domain/repository/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final TempDataSource dataSource;

  DeviceRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Device>?>> getAllDevices() async {
    try {
      List<Device>? allDevices = await dataSource.getAllDevices();
      return Right(allDevices);
    } catch (e) {
      return Left(UnExpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addNewRoutine(
      int id, RoutineModel routine) async {
    try {
      bool isOk = await dataSource.addNewRoutines(id, routine);
      if (isOk) {
        return Right(isOk);
      } else {
        return Left(UnExpected("Data source return false"));
      }
    } catch (e) {
      return Left(UnExpected(e.toString()));
    }
  }
}
