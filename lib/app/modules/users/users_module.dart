import 'package:admiserv_adm/app/app_module.dart';
import 'package:admiserv_adm/app/modules/users/domain/repositories/users_repository.dart';
import 'package:admiserv_adm/app/modules/users/external/datasource/users_datasource_firebase_imp.dart';
import 'package:admiserv_adm/app/modules/users/infra/datasources/users_datasource.dart';
import 'package:admiserv_adm/app/modules/users/infra/repositories/users_repository_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/create_user/users_usecase_create_user.dart';
import 'domain/usecases/create_user/users_usecase_create_user_imp.dart';
import 'domain/usecases/edit_user/users_usecase_edit_user.dart';
import 'domain/usecases/edit_user/users_usecase_edit_user_imp.dart';
import 'domain/usecases/get_users/users_usecase_get_users.dart';
import 'domain/usecases/get_users/users_usecase_get_users_imp.dart';
import 'presentation/create_edit/page/users_create_edit_page.dart';
import 'presentation/create_edit/store/users_create_edit_store.dart';
import 'presentation/home/page/users_home_page.dart';
import 'presentation/home/store/users_home_store.dart';

class UsersModule extends Module {
  @override
  void binds(Injector i) {
    // Domain
    i.add<UsersUsecaseCreateUser>(UsersUsecaseCreateUserImp.new);
    i.add<UsersUsecaseEditUser>(UsersUsecaseEditUserImp.new);
    i.add<UsersUsecaseGetUsers>(UsersUsecaseGetUsersImp.new);
    // Infra
    i.add<UsersRepository>(UsersRepositoryImp.new);
    // External
    i.add<UsersDatasource>(UsersDatasourceFirebaseImp.new);
    // Stores
    i.add(UsersHomeStore.new);
    i.add(UsersCreateEditStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => UsersHomePage(store: Modular.get()), transition: TransitionType.fadeIn);
    r.child(
      "/create",
      child: (_) => UsersCreateEditPage(store: Modular.get()),
      transition: TransitionType.leftToRightWithFade,
    );
  }

  @override
  List<Module> get imports => [AppModule()];
}
