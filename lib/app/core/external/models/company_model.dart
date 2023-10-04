import 'package:admiserv_adm/app/core/domain/entites/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({required super.id, required super.nome, required super.createDate, required super.hasEnabled});

  factory CompanyModel.fromMap(Map<String, dynamic> m, String id) =>
      CompanyModel(createDate: "${DateTime.now()}", hasEnabled: m["has_enabled"], id: id, nome: m["nome"]);
}
