import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartx/core/error/failures.dart';
import 'package:smartx/features/splash/data/model/user_model.dart';
import 'package:smartx/features/splash/domain/entity/user.dart';
import 'package:smartx/features/splash/domain/usecase/cache_user_usecase.dart';
import 'package:smartx/features/splash/domain/usecase/get_user_usecase.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  CacheUserUseCase cacheUserUseCase;
  GetUserUseCase getUserUseCase;

  UserBloc({
    required this.cacheUserUseCase,
    required this.getUserUseCase,
  }) : super(const _Initial()) {
    on<_AddUser>((event, emit) async {
      await cacheUserUseCase.repository.cacheUser(event.user);
    });
    on<_GetUser>((event, emit) async {
      Either<Failure, User> userFold =
          await getUserUseCase.repository.getUser();

      userFold.fold(
        (failure) {
          emit(const _Empty());
        },
        (user) {
          emit(_Loaded(user));
        },
      );
    });
  }
  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is _GetUser) {
      add(const _GetUser());
    }
  }

  listen() async {
    add(const _GetUser());
  }
}
