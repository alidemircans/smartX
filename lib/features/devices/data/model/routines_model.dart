import 'package:json_annotation/json_annotation.dart';
import 'package:smartx/features/devices/domain/entity/routines.dart';

part 'routines_model.g.dart';

@JsonSerializable()
class RoutineModel extends Routine {
  const RoutineModel({
    required String name,
    required String description,
    required String whenRun,
  }) : super(
          name: name,
          description: description,
          whenRun: whenRun,
        );

  factory RoutineModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineModelToJson(this);
}
