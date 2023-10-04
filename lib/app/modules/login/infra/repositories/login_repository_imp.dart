import 'package:dartz/dartz.dart';

import '../../../../core/domain/entites/user_entity.dart';
import '../../../../core/domain/exceptions/failure_app.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_datasource.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDatasource _datasource;

  LoginRepositoryImp(this._datasource);
  @override
  Future<Either<FailureApp, UserEntity>> login(String email, String password) async {
    try {
      return Right(await _datasource.login(email, password));
    } on FailureApp catch (e) {
      return Left(e);
    }
  }
}
