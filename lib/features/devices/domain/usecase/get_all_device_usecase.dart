import 'package:dartz/dartz.dart';
import 'package:smartx/core/base/usecases/usecase.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';

import '../repository/device_repository.dart';

class GetAllDevicesUseCase implements UseCase<List<Device>?, Device> {
  final DeviceRepository repository;

  GetAllDevicesUseCase(this.repository);
  @override
  Future<Either<Failure, List<Device>?>> call(Device device) {
    return repository.getAllDevices();
  }
}
