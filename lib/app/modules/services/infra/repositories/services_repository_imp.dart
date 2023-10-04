import 'package:admiserv_adm/app/core/domain/entites/service_entity.dart';

import 'package:admiserv_adm/app/core/domain/exceptions/failure_app.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/services_repository.dart';
import '../datasources/services_datasource.dart';

class ServicesRepositoryImp implements ServicesRepository {
  final ServicesDatasource _datasource;

  ServicesRepositoryImp(this._datasource);
  @override
  Future<Either<FailureApp, void>> addService(String descServ, {int? timeMaintein}) async {
    try {
      return Right(await _datasource.addService(descServ, timeMaintein: timeMaintein));
    } on FailureApp catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<FailureApp, void>> editService(ServiceEntity oldService, ServiceEntity newService) async {
    try {
      return Right(await _datasource.editService(oldService, newService));
    } on FailureApp catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<FailureApp, List<ServiceEntity>>> getServices() async {
    try {
      return Right(await _datasource.getServices());
    } on FailureApp catch (e) {
      return Left(e);
    }
  }
}
