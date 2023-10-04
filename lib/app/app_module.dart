import 'package:admiserv_adm/app/core/main_singleton/main_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/presentation/states/core_scaffold/core_scaffold_page.dart';
import 'modules/home/home_module.dart';
import 'modules/home/presentation/home_routes/components/drawer/store/sidebar_store.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(() => FirebaseFirestore.instance);
    i.add(() => FirebaseAuth.instance);
    i.add(CoreScaffoldStore.new);
    i.add(() => SideBarStore());
    i.addSingleton(MainSingleton.new);
  }

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    // Modules
    r.module(Modular.initialRoute, module: HomeModule());
    r.module("/login", module: LoginModule());
  }
}
