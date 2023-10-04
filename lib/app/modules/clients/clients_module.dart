import 'package:admiserv_adm/app/modules/clients/presentation/home/page/clients_home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/add_edit/page/clients_add_edit_page.dart';
import 'presentation/add_edit/store/clients_add_edit_store.dart';
import 'presentation/home/store/clients_home_store.dart';

class ClientsModule extends Module {
  @override
  void binds(Injector i) {
    i.add(ClientsHomeStore.new);
    i.add(ClientsAddEditStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => ClientsHomePage(store: Modular.get()), transition: TransitionType.fadeIn);
    r.child("/add",
        child: (_) => ClientsAddEditPage(store: Modular.get()), transition: TransitionType.leftToRightWithFade);
  }
}
