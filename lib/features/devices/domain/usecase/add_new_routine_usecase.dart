import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smartx/core/base/usecases/usecase.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/devices/data/model/routines_model.dart';

import '../repository/device_repository.dart';

class AddNewRoutineUseCase implements UseCase<bool, AddNewRoutineModel> {
  final DeviceRepository repository;

  AddNewRoutineUseCase(this.repository);
  @override
  Future<Either<Failure, bool>> call(AddNewRoutineModel addNewRoutineModel) {
    return repository.addNewRoutine(
      addNewRoutineModel.id,
      addNewRoutineModel.routine,
    );
  }
}

class AddNewRoutineModel extends Equatable {
  final int id;
  final RoutineModel routine;

  const AddNewRoutineModel({required this.id, required this.routine});

  @override
  List<Object?> get props => [id, routine];
}
