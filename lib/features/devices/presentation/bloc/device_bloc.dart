import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartx/features/devices/data/model/routines_model.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';
import 'package:smartx/features/devices/domain/usecase/add_new_routine_usecase.dart';
import 'package:smartx/features/devices/domain/usecase/get_all_device_usecase.dart';

part 'device_bloc.freezed.dart';
part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  GetAllDevicesUseCase getAllDevicesUseCase;
  AddNewRoutineUseCase addNewRoutineUseCase;

  DeviceBloc({
    required this.getAllDevicesUseCase,
    required this.addNewRoutineUseCase,
  }) : super(const _Initial()) {
    on<_GetAllDevices>((event, emit) async {
      final getAllDeviceEither =
          await getAllDevicesUseCase.repository.getAllDevices();

      getAllDeviceEither.fold((l) {
        emit(const _Error());
      }, (devices) {
        if (devices != null) {
          emit(_Loaded(devices));
        } else {
          emit(const _Empty());
        }
      });
    });

    on<_AddNewRoutine>((event, emit) async {
      print("Event Datas : ${event.id} ${event.routine.name}");
      final addNewRoutineEither = await addNewRoutineUseCase.repository
          .addNewRoutine(event.id, event.routine);

      addNewRoutineEither.fold((l) {
        emit(const _Error());
      }, (isOk) {
        if (isOk) {
          add(const _GetAllDevices());
        }
      });
    });
  }
}
