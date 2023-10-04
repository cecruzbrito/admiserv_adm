import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entites/user_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';

abstract class LoginUsecaseLogin {
  Future<Either<FailureApp, UserEntity>> call(String email, String password);
}
