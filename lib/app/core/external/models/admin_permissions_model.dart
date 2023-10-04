import 'package:admiserv_adm/app/core/domain/entites/admin_permissions_entity.dart';

class AdminPermissionsModel extends AdminPermissionsEntity {
  AdminPermissionsModel({required super.hasEnabled});

  toMap() => {"enabled": hasEnabled};

  factory AdminPermissionsModel.fromMap(dynamic p) => AdminPermissionsModel(hasEnabled: p["has_enabled"]);
}
