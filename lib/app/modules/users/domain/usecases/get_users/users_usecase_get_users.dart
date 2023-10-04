import 'package:dartz/dartz.dart';

import '../../../../../core/domain/exceptions/failure_app.dart';
import '../../entites/user_db_entity.dart';

abstract class UsersUsecaseGetUsers {
  Future<Either<FailureApp, List<UserDBEntity>>> call();
}
