import '../../../../core/domain/entites/user_entity.dart';
import '../../domain/entites/user_db_entity.dart';

abstract class UsersDatasource {
  Future<void> createUser({required String name, required String email, required String password});
  Future<void> editUser(UserEntity newUser);
  Future<List<UserDBEntity>> getUsers();
}
