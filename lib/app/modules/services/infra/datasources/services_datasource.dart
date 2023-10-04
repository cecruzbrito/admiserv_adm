import '../../../../core/domain/entites/service_entity.dart';

abstract class ServicesDatasource {
  Future<List<ServiceEntity>> getServices();
  Future<void> addService(String descServ, {int? timeMaintein});
  Future<void> editService(ServiceEntity oldService, ServiceEntity newService);
}
