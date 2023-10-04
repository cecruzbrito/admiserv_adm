import 'package:admiserv_adm/app/modules/services/domain/repositories/services_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entites/service_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';
import 'service_usecase_edit_service.dart';

class ServicesUsecaseEditServiceImp implements ServicesUsecaseEditService {
  final ServicesRepository _repository;

  ServicesUsecaseEditServiceImp(this._repository);

  @override
  Future<Either<FailureApp, void>> call(ServiceEntity oldService, ServiceEntity newService) async =>
      await _repository.editService(oldService, newService);
}
