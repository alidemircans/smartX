import 'package:equatable/equatable.dart';
import 'package:smartx/features/devices/data/model/routines_model.dart';

class Device extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final List<RoutineModel> routines;

  const Device(
      {required this.description,
      required this.image,
      required this.id,
      required this.name,
      required this.routines});

  @override
  List<Object?> get props => [id, name];
}
