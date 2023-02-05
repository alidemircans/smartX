import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smartx/features/devices/data/model/routines_model.dart';
import 'package:smartx/features/devices/domain/repository/device_repository.dart';
import 'package:smartx/features/devices/domain/usecase/add_new_routine_usecase.dart';

import 'add_new_routine_usecase_test.mocks.dart';

class DeviceRepositoryTest extends Mock implements DeviceRepository {}

@GenerateMocks([DeviceRepositoryTest])
void main() {
  late AddNewRoutineUseCase useCase;
  late MockDeviceRepositoryTest repository;

  setUp(() {
    repository = MockDeviceRepositoryTest();
    useCase = AddNewRoutineUseCase(repository);
  });

  RoutineModel routine =
      const RoutineModel(name: "", description: "", whenRun: "");

  test("should return Device list", () async {
    // arrange
    when(repository.addNewRoutine(1, routine))
        .thenAnswer((_) async => Future.value(const Right(true)));

    // act
    final result = await useCase(AddNewRoutineModel(id: 1, routine: routine));
    //assert
    expect(result, const Right(true));
  });
}
