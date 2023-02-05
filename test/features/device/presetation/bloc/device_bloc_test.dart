import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smartx/features/devices/domain/usecase/add_new_routine_usecase.dart';
import 'package:smartx/features/devices/domain/usecase/get_all_device_usecase.dart';
import 'package:smartx/features/devices/presentation/bloc/device_bloc.dart';

import 'device_bloc_test.mocks.dart';

class DeviceBlocGetAllDevicesUseCaseTest extends Mock
    implements GetAllDevicesUseCase {}

class DeviceBlocAddNewRoutineUseCaseTest extends Mock
    implements AddNewRoutineUseCase {}

@GenerateMocks(
    [DeviceBlocGetAllDevicesUseCaseTest, DeviceBlocAddNewRoutineUseCaseTest])
void main() {
  late DeviceBloc deviceBloc;
  MockDeviceBlocGetAllDevicesUseCaseTest mockDeviceBlocGetAllDevicesUseCaseTest;
  DeviceBlocAddNewRoutineUseCaseTest mockBlocAddNewRoutineUseCaseTest;

  setUp(() {
    mockDeviceBlocGetAllDevicesUseCaseTest =
        MockDeviceBlocGetAllDevicesUseCaseTest();
    mockBlocAddNewRoutineUseCaseTest = DeviceBlocAddNewRoutineUseCaseTest();
    deviceBloc = DeviceBloc(
      getAllDevicesUseCase: mockDeviceBlocGetAllDevicesUseCaseTest,
      addNewRoutineUseCase: mockBlocAddNewRoutineUseCaseTest,
    );
  });

  test('initialState should be initial', () {
    // assert
    expect(deviceBloc.state, equals(const DeviceState.initial()));
  });
}
