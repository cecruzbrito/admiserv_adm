import 'package:admiserv_adm/app/core/domain/entites/service_entity.dart';

class ServiceModel extends ServiceEntity {
  ServiceModel(
      {required super.id,
      required super.desc,
      required super.hasEnabled,
      required super.daysToMaintenance,
      required super.dateCreated});

  factory ServiceModel.fromMap(Map<String, dynamic> m, String id) => ServiceModel(
      id: id,
      desc: m["desc"],
      hasEnabled: m["has_enabled"],
      daysToMaintenance: m["days_maintenance"],
      dateCreated: DateTime.parse(m["date_created"]));

  factory ServiceModel.addService(String descServ, {int? daysToMaintenance}) => ServiceModel(
      hasEnabled: true, id: "", daysToMaintenance: daysToMaintenance, desc: descServ, dateCreated: DateTime.now());

  factory ServiceModel.fromEntity(ServiceEntity entity) => ServiceModel(
      daysToMaintenance: entity.daysToMaintenance,
      desc: entity.desc,
      hasEnabled: entity.hasEnabled,
      id: entity.id,
      dateCreated: entity.dateCreated);

  Map<String, dynamic> toMap() {
    var map = {
      "desc": desc,
      "has_enabled": hasEnabled,
      "days_maintenance": daysToMaintenance,
      "date_created": "$dateCreated"
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
