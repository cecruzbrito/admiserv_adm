import 'package:dartz/dartz.dart';

import '../../../../../core/domain/exceptions/failure_app.dart';
import '../../repositories/users_repository.dart';
import 'users_usecase_create_user.dart';

class UsersUsecaseCreateUserImp extends UsersUsecaseCreateUser {
  final UsersRepository _repository;

  UsersUsecaseCreateUserImp(this._repository);
  @override
  Future<Either<FailureApp, void>> call(
          {required String name, required String email, required String password}) async =>
      await _repository.createUser(name: name, email: email, password: password);
}
