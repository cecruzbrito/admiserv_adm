import 'package:admiserv_adm/app/modules/users/domain/repositories/users_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/domain/exceptions/failure_app.dart';
import '../../entites/user_db_entity.dart';
import 'users_usecase_get_users.dart';

class UsersUsecaseGetUsersImp implements UsersUsecaseGetUsers {
  final UsersRepository _repository;
  UsersUsecaseGetUsersImp(this._repository);
  @override
  Future<Either<FailureApp, List<UserDBEntity>>> call() async => _repository.getUsers();
}
