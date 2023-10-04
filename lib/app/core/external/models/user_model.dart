import '../../domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.nome,
      required super.id,
      required super.idCompany,
      required super.email,
      required super.hasEnabled,
      required super.permissions});

  factory UserModel.fromMap(Map<String, dynamic> m, String email, String id) => UserModel(
      email: email,
      nome: m["nome"],
      hasEnabled: m["has_enabled"],
      id: id,
      permissions: null,
      idCompany: m["id_company"]);

  toMap() => {
        "nome": nome,
        "has_enabled": hasEnabled,
        "id_company": idCompany,
      };

  factory UserModel.createUser(
          {required String email,
          required String nome,
          required String password,
          required String id,
          required String idCompany}) =>
      UserModel(nome: nome, id: id, idCompany: idCompany, email: email, hasEnabled: true, permissions: null);

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
      email: entity.email,
      hasEnabled: entity.hasEnabled,
      id: entity.id,
      idCompany: entity.idCompany,
      nome: entity.nome,
      permissions: null);
}
