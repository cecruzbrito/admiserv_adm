import 'package:dartz/dartz.dart';

import '../../../../core/domain/entites/user_entity.dart';
import '../../../../core/domain/exceptions/failure_app.dart';
import '../entites/user_db_entity.dart';

abstract class UsersRepository {
  Future<Either<FailureApp, void>> createUser({required String name, required String email, required String password});
  Future<Either<FailureApp, void>> editUser(UserEntity newUser);
  Future<Either<FailureApp, List<UserDBEntity>>> getUsers();
}
