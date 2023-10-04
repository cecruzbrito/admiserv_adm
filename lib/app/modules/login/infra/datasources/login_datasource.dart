import 'package:admiserv_adm/app/core/domain/entites/user_entity.dart';

abstract class LoginDatasource {
  Future<UserEntity> login(String email, String password);
}
