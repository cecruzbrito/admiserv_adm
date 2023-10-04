import 'package:admiserv_adm/app/modules/services/services_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../clients/clients_module.dart';
import '../users/users_module.dart';
import 'presentation/home_routes/home_routes_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/",
        child: (_) => const HomeRoutesPage(),
        // guards: [GuardAuthUser()],
        children: [
          ModuleRoute("/services", module: ServiceModule()),
          ModuleRoute("/users", module: UsersModule()),
          ModuleRoute("/clients", module: ClientsModule())
        ]);
  }

  @override
  List<Module> get imports => [AppModule()];
}
