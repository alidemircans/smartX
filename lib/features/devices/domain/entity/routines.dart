import 'package:equatable/equatable.dart';

class Routine extends Equatable {
  final String name;
  final String description;
  final String whenRun;

  const Routine({
    required this.name,
    required this.description,
    required this.whenRun,
  });

  @override
  List<Object?> get props => [name, description, whenRun];
}
