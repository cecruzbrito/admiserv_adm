import 'package:admiserv_adm/app/modules/users/presentation/home/store/users_home_state.dart';
import 'package:admiserv_adm/app/modules/users/presentation/home/widgets/widget_alert_edit_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/presentation/states/core_outlet_page/core_outlet_page.dart';
import '../components/component_list_users.dart';
import '../store/users_home_store.dart';
import '../widgets/widget_button_add_users.dart';

class UsersHomePage extends StatefulWidget {
  const UsersHomePage({super.key, required this.store});
  final UsersHomeStore store;
  @override
  State<UsersHomePage> createState() => _UsersHomePageState();
}

class _UsersHomePageState extends CoreOutletPage<UsersHomePage> {
  _UsersHomePageState() : super(title: "Admiserv - Usuários");
  UsersHomeStore get store => widget.store;

  @override
  void initState() {
    super.initState();
    store.observer(onError: setError, onLoading: setLoading);
    store.initialGetUsers();
  }

  @override
  Scaffold configScaffold() => Scaffold(
        floatingActionButton: WidgetButtonAddUser(onTap: store.onTapAdicionar),
      );

  @override
  Widget body(BuildContext context) {
    return TripleBuilder<UsersHomeStore, UsersHomeState>(
        store: store,
        builder: (_, trp) {
          onTapOnChangeUser2(value, user) async => await store.onTapOnChangeUser(
              value,
              user,
              () async => await showDialogApp(WidgetAlertEdit(
                    user: user,
                    callBackNegative: store.alertOnTapNegative,
                    callBackPositive: store.alertOnTapPositive,
                  )),
              setSucess);
          return ComponentListUsers(
            stts: SttsListUsers(users: trp.state.users, onTapOnChangeUser: onTapOnChangeUser2),
          );
        });
  }
}
