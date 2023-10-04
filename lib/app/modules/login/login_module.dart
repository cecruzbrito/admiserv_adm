import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import 'domain/guards/guard_login.dart';
import 'domain/repositories/login_repository.dart';
import 'domain/usecases/login/login_usecase_login.dart';
import 'domain/usecases/login/login_usecase_login_imp.dart';
import 'external/datasources/login_datasource_firebase_imp.dart';
import 'infra/datasources/login_datasource.dart';
import 'infra/repositories/login_repository_imp.dart';
import 'presentation/login/login_page.dart';
import 'presentation/login/store/login_store.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    // Domain
    i.add<LoginUsecaseLogin>(LoginUsecaseLoginImp.new);
    // Infra
    i.add<LoginRepository>(LoginRepositoryImp.new);
    // External
    i.add<LoginDatasource>(LoginDatasourceFirebaseImp.new);
    // Store
    i.add(LoginStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => LoginPage(store: Modular.get()), guards: [GuardLogin()]);
  }

  @override
  List<Module> get imports => [AppModule()];
}
