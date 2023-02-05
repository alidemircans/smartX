part of 'device_bloc.dart';

@freezed
class DeviceEvent with _$DeviceEvent {
  const factory DeviceEvent.GetAllDevices() = _GetAllDevices;
  const factory DeviceEvent.AddNewRoutine(int id, RoutineModel routine) =
      _AddNewRoutine;
}
