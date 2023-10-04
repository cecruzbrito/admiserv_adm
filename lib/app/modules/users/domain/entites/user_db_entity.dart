import 'package:admiserv_adm/app/core/domain/entites/user_entity.dart';

class UserDBEntity extends UserEntity {
  UserDBEntity(
      {required super.id,
      required super.idCompany,
      required super.hasEnabled,
      required super.permissions,
      required super.nome})
      : super(email: "");
}
