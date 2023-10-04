// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'admin_permissions_entity.dart';
import 'app_permissions_entity.dart';

class PermissionsEntity {
  final AdminPermissionsEntity? adminPermission;
  final AppPermissionsEntity? appPermissions;
  PermissionsEntity({
    required this.adminPermission,
    required this.appPermissions,
  });

  PermissionsEntity copyWith({
    AdminPermissionsEntity? adminPermission,
    AppPermissionsEntity? appPermissions,
  }) {
    return PermissionsEntity(
      adminPermission: adminPermission ?? this.adminPermission,
      appPermissions: appPermissions ?? this.appPermissions,
    );
  }
}
