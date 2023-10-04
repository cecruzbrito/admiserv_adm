import 'package:admiserv_adm/app/core/domain/entites/permissions_entity.dart';
import 'package:admiserv_adm/app/core/external/models/admin_permissions_model.dart';
import 'package:admiserv_adm/app/core/external/models/app_permissions_model.dart';

class PermissionsModel extends PermissionsEntity {
  PermissionsModel({required super.adminPermission, required super.appPermissions});

  static PermissionsModel fromMap(dynamic m) => PermissionsModel(
      adminPermission: AdminPermissionsModel.fromMap(m["admin"]), appPermissions: AppPermissionModel.fromMap(m["app"]));
}
