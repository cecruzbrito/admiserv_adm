import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entites/service_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';

abstract class ServicesUsecaseGetServices {
  Future<Either<FailureApp, List<ServiceEntity>>> call();
}
