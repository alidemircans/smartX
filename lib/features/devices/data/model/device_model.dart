import 'package:json_annotation/json_annotation.dart';
import 'package:smartx/features/devices/data/model/routines_model.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';

part 'device_model.g.dart';

@JsonSerializable()
class DeviceModel extends Device {
  const DeviceModel({
    required int id,
    required String name,
    required String image,
    required String description,
    required List<RoutineModel> routines,
  }) : super(
            id: id,
            name: name,
            image: image,
            description: description,
            routines: routines);

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);
}
