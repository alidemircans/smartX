part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.AddUser(UserModel user) = _AddUser;
  const factory UserEvent.GetUser() = _GetUser;
}
