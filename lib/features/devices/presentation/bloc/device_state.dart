part of 'device_bloc.dart';

@freezed
class DeviceState with _$DeviceState {
  const factory DeviceState.initial() = _Initial;
  const factory DeviceState.loading() = _Loading;
  const factory DeviceState.empty() = _Empty;
  const factory DeviceState.error() = _Error;
  const factory DeviceState.loaded(List<Device> devices) = _Loaded;
}
