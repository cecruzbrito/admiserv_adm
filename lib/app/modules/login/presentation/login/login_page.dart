import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../core/presentation/states/core_scaffold/core_scaffold_page.dart';
import 'components/component_login_card.dart';
import 'store/login_state.dart';
import 'store/login_store.dart';
import 'widgets/widget_form_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.store});
  final LoginStore store;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends CoreState<LoginPage> {
  _LoginPageState() : super(title: "Adminserv - Login");

  LoginStore get store => widget.store;

  @override
  void initState() {
    super.initState();
    store.observer(onLoading: setLoading, onError: setError);
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: TripleBuilder<LoginStore, LoginState>(
              store: store,
              builder: (_, trp) {
                final sttsComponentLoginCard = SttsFormLogin(
                    onTapContinue: store.onTapContinue,
                    formKey: store.formKey,
                    hasKeepConected: trp.state.hasKeepConected,
                    hasObscurePassword: trp.state.hasObscurePassword,
                    ctrTextEmail: store.ctrTextEmail,
                    ctrTextPassword: store.ctrTextPassword,
                    onTapKeepConected: store.onTapKeepConected,
                    onTapObscurePassword: store.onTapObscurePassword);
                return ComponentLoginCard(stts: sttsComponentLoginCard);
              }),
        ),
      ),
    );
  }
}
