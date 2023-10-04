import 'package:dartz/dartz.dart';

import '../../../../core/domain/entites/user_entity.dart';
import '../../../../core/domain/exceptions/failure_app.dart';
import '../../domain/entites/user_db_entity.dart';
import '../../domain/repositories/users_repository.dart';
import '../datasources/users_datasource.dart';

class UsersRepositoryImp implements UsersRepository {
  final UsersDatasource _datasource;

  UsersRepositoryImp(this._datasource);
  @override
  Future<Either<FailureApp, void>> createUser(
      {required String name, required String email, required String password}) async {
    try {
      return Right(await _datasource.createUser(name: name, email: email, password: password));
    } on FailureApp catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<FailureApp, void>> editUser(UserEntity newUser) async {
    try {
      return Right(await _datasource.editUser(newUser));
    } on FailureApp catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<FailureApp, List<UserDBEntity>>> getUsers() async {
    try {
      return Right(await _datasource.getUsers());
    } on FailureApp catch (e) {
      return Left(e);
    }
  }
}
