import 'package:dartz/dartz.dart';

import '../../../../core/domain/entites/service_entity.dart';
import '../../../../core/domain/exceptions/failure_app.dart';

abstract class ServicesRepository {
  Future<Either<FailureApp, List<ServiceEntity>>> getServices();
  Future<Either<FailureApp, void>> addService(String descServ, {int? timeMaintein});
  Future<Either<FailureApp, void>> editService(ServiceEntity oldService, ServiceEntity newService);
}
