// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admiserv_adm/app/core/domain/entites/modification_entity.dart';
import 'package:admiserv_adm/app/core/domain/entites/permissions_entity.dart';
import 'package:admiserv_adm/app/core/domain/entites/service_entity.dart';

class CompanyEntity {
  final String id;
  final String nome;
  final String createDate;
  final bool hasEnabled;
  final List<ModificationsEntity>? modifcations;
  final PermissionsEntity? permissions;
  final List<ServiceEntity>? services;
  CompanyEntity({
    required this.id,
    required this.nome,
    required this.createDate,
    required this.hasEnabled,
    this.modifcations,
    this.permissions,
    this.services,
  });

  CompanyEntity copyWith({
    String? id,
    String? nome,
    String? createDate,
    bool? hasEnabled,
    List<ModificationsEntity>? modifcations,
    PermissionsEntity? permissions,
    List<ServiceEntity>? services,
  }) {
    return CompanyEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      createDate: createDate ?? this.createDate,
      hasEnabled: hasEnabled ?? this.hasEnabled,
      modifcations: modifcations ?? this.modifcations,
      permissions: permissions ?? this.permissions,
      services: services ?? this.services,
    );
  }
}
