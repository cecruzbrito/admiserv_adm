import 'package:admiserv_adm/app/modules/users/domain/repositories/users_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entites/user_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';
import 'users_usecase_edit_user.dart';

class UsersUsecaseEditUserImp implements UsersUsecaseEditUser {
  final UsersRepository _repository;
  UsersUsecaseEditUserImp(this._repository);

  @override
  Future<Either<FailureApp, void>> call(UserEntity newUser) async => await _repository.editUser(newUser);
}
