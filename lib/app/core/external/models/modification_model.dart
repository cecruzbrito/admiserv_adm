import 'package:admiserv_adm/app/core/domain/entites/modification_entity.dart';

class ModificationsModel extends ModificationsEntity {
  ModificationsModel({required super.id, required super.date, required super.idUser, required super.fieldsModificated});

  factory ModificationsModel.fromMap(dynamic m) => ModificationsModel(
      id: m["id"],
      date: DateTime.parse(m["date"]),
      idUser: m["id_user_admin"],
      fieldsModificated: m["fields_modificated"]);
}
