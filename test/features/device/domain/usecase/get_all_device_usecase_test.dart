import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';
import 'package:smartx/features/devices/domain/repository/device_repository.dart';
import 'package:smartx/features/devices/domain/usecase/get_all_device_usecase.dart';

import 'get_all_device_usecase_test.mocks.dart';

class DeviceRepositoryTest extends Mock implements DeviceRepository {}

@GenerateMocks([DeviceRepositoryTest])
void main() {
  late GetAllDevicesUseCase useCase;
  late MockDeviceRepositoryTest repository;

  setUp(() {
    repository = MockDeviceRepositoryTest();
    useCase = GetAllDevicesUseCase(repository);
  });

  List<Device> devices = [
    const Device(
        description: "This is a car",
        image: "",
        id: 1,
        name: "Car",
        routines: [])
  ];

  test("should return Device list", () async {
    // arrange
    when(repository.getAllDevices())
        .thenAnswer((_) async => Future.value(Right(devices)));

    // act
    final result = await useCase(devices[0]);
    //assert
    expect(result, Right(devices));
  });

  test("should return Failure list", () async {
    // arrange
    when(repository.getAllDevices())
        .thenAnswer((_) async => Future.value(Left(UnExpected(""))));

    // act
    final result = await useCase(devices[0]);
    //assert
    expect(result, Left(UnExpected("")));
  });
}
