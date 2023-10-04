// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'company_entity.dart';
import 'permissions_entity.dart';

class UserEntity {
  final String nome;
  final String id;
  final String idCompany;
  final String email;
  final bool hasEnabled;
  final PermissionsEntity? permissions;
  final CompanyEntity? company;
  UserEntity(
      {required this.nome,
      required this.id,
      required this.idCompany,
      required this.email,
      required this.hasEnabled,
      required this.permissions,
      this.company});

  UserEntity copyWith({
    String? nome,
    String? id,
    String? idCompany,
    String? email,
    bool? hasEnabled,
    PermissionsEntity? permissions,
    CompanyEntity? company,
  }) {
    return UserEntity(
      nome: nome ?? this.nome,
      id: id ?? this.id,
      idCompany: idCompany ?? this.idCompany,
      email: email ?? this.email,
      hasEnabled: hasEnabled ?? this.hasEnabled,
      permissions: permissions ?? this.permissions,
      company: company ?? this.company,
    );
  }
}
