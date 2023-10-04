import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entites/user_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';
import '../../repositories/login_repository.dart';
import 'login_usecase_login.dart';

class LoginUsecaseLoginImp implements LoginUsecaseLogin {
  final LoginRepository _repository;

  LoginUsecaseLoginImp(this._repository);
  @override
  Future<Either<FailureApp, UserEntity>> call(String email, String password) async =>
      _repository.login(email, password);

  x(LoginRepository r) {}
}
