import 'package:admiserv_adm/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/guards/guard_edit_service.dart';
import 'domain/repositories/services_repository.dart';
import 'domain/usecases/add_service/service_usecase_add_service.dart';
import 'domain/usecases/add_service/service_usecase_add_service_imp.dart';
import 'domain/usecases/edit_service/service_usecase_edit_service.dart';
import 'domain/usecases/edit_service/service_usecase_edit_service_imp.dart';
import 'domain/usecases/get_services/services_usecase_get_services.dart';
import 'domain/usecases/get_services/services_usecase_get_services_imp.dart';
import 'external/datasources/services_datasource_imp_firebase.dart';
import 'infra/datasources/services_datasource.dart';
import 'infra/repositories/services_repository_imp.dart';
import 'presentation/create_edit/page/service_create_edit_page.dart';
import 'presentation/create_edit/store/service_create_edit_store.dart';
import 'presentation/home/page/services_home_page.dart';
import 'presentation/home/store/services_home_store.dart';

class ServiceModule extends Module {
  @override
  void binds(Injector i) {
    // Domain
    i.add<ServicesUsecaseAddService>(ServicesUsecaseAddServiceImp.new);
    i.add<ServicesUsecaseGetServices>(ServicesUsecaseGetServicesImp.new);
    i.add<ServicesUsecaseEditService>(ServicesUsecaseEditServiceImp.new);

    // Infra
    i.add<ServicesRepository>(ServicesRepositoryImp.new);

    // External
    i.add<ServicesDatasource>(ServicesDatasourceImpFirebse.new);

    // Stores
    i.add(ServiceCreateEditStore.new);
    i.add(ServicesHomeStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => ServicesHomePage(store: Modular.get()), transition: TransitionType.fadeIn);
    r.child(
      "/create",
      child: (_) => ServiceCreateEditPage(store: Modular.get()),
      transition: TransitionType.leftToRightWithFade,
    );
    r.child("/edit",
        child: (_) => ServiceCreateEditPage(store: Modular.get(), serviceEdit: r.args.data),
        guards: [GuardEditServices()],
        transition: TransitionType.leftToRightWithFade);
  }

  @override
  List<Module> get imports => [AppModule()];
}
