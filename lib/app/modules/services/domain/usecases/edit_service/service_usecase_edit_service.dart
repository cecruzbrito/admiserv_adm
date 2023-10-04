import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entites/service_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';

abstract class ServicesUsecaseEditService {
  Future<Either<FailureApp, void>> call(ServiceEntity oldService, ServiceEntity newService);
}
