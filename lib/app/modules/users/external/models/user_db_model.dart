import 'package:admiserv_adm/app/modules/users/domain/entites/user_db_entity.dart';

class UserDBModel extends UserDBEntity {
  UserDBModel(
      {required super.id,
      required super.idCompany,
      required super.hasEnabled,
      required super.permissions,
      required super.nome});

  factory UserDBModel.fromMap(Map<String, dynamic> m, String id) =>
      UserDBModel(hasEnabled: m["has_enabled"], id: id, permissions: null, idCompany: m["id_company"], nome: m["nome"]);
}
