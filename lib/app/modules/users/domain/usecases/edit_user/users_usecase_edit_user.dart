import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entites/user_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';

abstract class UsersUsecaseEditUser {
  Future<Either<FailureApp, void>> call(UserEntity newUser);
}
