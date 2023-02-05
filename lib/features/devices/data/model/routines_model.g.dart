// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routines_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineModel _$RoutineModelFromJson(Map<String, dynamic> json) => RoutineModel(
      name: json['name'] as String,
      description: json['description'] as String,
      whenRun: json['whenRun'] as String,
    );

Map<String, dynamic> _$RoutineModelToJson(RoutineModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'whenRun': instance.whenRun,
    };
