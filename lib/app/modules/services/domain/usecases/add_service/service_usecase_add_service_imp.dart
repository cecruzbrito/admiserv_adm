import 'package:admiserv_adm/app/modules/services/domain/repositories/services_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/domain/exceptions/failure_app.dart';
import 'service_usecase_add_service.dart';

class ServicesUsecaseAddServiceImp extends ServicesUsecaseAddService {
  final ServicesRepository _repository;

  ServicesUsecaseAddServiceImp(this._repository);
  @override
  Future<Either<FailureApp, void>> call(String descServ, {int? timeMaintein}) async =>
      await _repository.addService(descServ, timeMaintein: timeMaintein);
}
