import 'package:admiserv_adm/app/modules/services/domain/repositories/services_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entites/service_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';
import 'services_usecase_get_services.dart';

class ServicesUsecaseGetServicesImp implements ServicesUsecaseGetServices {
  final ServicesRepository _repository;
  ServicesUsecaseGetServicesImp(this._repository);

  @override
  Future<Either<FailureApp, List<ServiceEntity>>> call() async => await _repository.getServices();
}
