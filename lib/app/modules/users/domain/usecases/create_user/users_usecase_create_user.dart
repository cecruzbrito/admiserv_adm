import 'package:dartz/dartz.dart';

import '../../../../../core/domain/exceptions/failure_app.dart';

abstract class UsersUsecaseCreateUser {
  Future<Either<FailureApp, void>> call({required String name, required String email, required String password});
}
