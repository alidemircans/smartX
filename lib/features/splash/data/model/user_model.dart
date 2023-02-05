import 'package:json_annotation/json_annotation.dart';
import 'package:smartx/features/splash/domain/entity/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
