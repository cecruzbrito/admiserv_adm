import 'package:dartz/dartz.dart';

import '../../../../../core/domain/exceptions/failure_app.dart';

abstract class ServicesUsecaseAddService {
  Future<Either<FailureApp, void>> call(String descServ, {int? timeMaintein});
}
