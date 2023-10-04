import 'package:admiserv_adm/app/modules/users/presentation/create_edit/components/component_form_add_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/domain/entites/user_entity.dart';
import '../../../../../core/presentation/states/core_outlet_page/core_outlet_page.dart';
import '../store/users_create_edit_state.dart';
import '../store/users_create_edit_store.dart';

class UsersCreateEditPage extends StatefulWidget {
  const UsersCreateEditPage({super.key, this.user, required this.store});
  final UserEntity? user;
  final UsersCreateEditStore store;
  @override
  State<UsersCreateEditPage> createState() => _UsersCreateEditPageState();
}

class _UsersCreateEditPageState extends CoreOutletPage<UsersCreateEditPage> {
  _UsersCreateEditPageState() : super(title: "Admiserv - Gerenciar usuários");
  UsersCreateEditStore get store => widget.store;

  @override
  void initState() {
    super.initState();
    store.observer(onError: setError, onLoading: setLoading);
  }

  @override
  Widget body(BuildContext context) {
    return TripleBuilder<UsersCreateEditStore, UsersCreateEditState>(
        store: store,
        builder: (_, trp) => SingleChildScrollView(
                child: ComponentFormAddUser(
              stts: SttsFormAddUser(
                  onTapVoltar: store.onTapVoltar,
                  formKey: store.formKey,
                  ctrTextName: store.ctrTextName,
                  ctrTextEmail: store.ctrTextEmail,
                  ctrTextPassword: store.ctrTextPassword,
                  ctrTextConfirmPassword: store.ctrTextConfirmPassword,
                  hasShowPassword: trp.state.hasShowPassword,
                  onTapShowPassword: store.onTapShowPassword,
                  hasShowConfirmPassword: trp.state.hasShowConfirmPassword,
                  onTapShowConfirmPassword: store.onTapShowConfirmPassword,
                  onTapConfirm: () => store.onTapConfirm(setSucess)),
            )));
  }
}
