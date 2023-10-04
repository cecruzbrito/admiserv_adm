import 'package:admiserv_adm/app/core/domain/entites/app_permissions_entity.dart';

class AppPermissionModel extends AppPermissionsEntity {
  AppPermissionModel({required super.hasEnabled});

  toMap() => {"enabled": hasEnabled};

  factory AppPermissionModel.fromMap(dynamic p) => AppPermissionModel(hasEnabled: p["has_enabled"]);
}
