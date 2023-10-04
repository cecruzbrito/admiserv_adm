import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/domain/entites/user_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';
import '../../../domain/usecases/login/login_usecase_login.dart';
import 'login_state.dart';

class LoginStore extends Store<LoginState> {
  final LoginUsecaseLogin _usecaseLogin;
  LoginStore(this._usecaseLogin) : super(LoginState.initialState);

  final formKey = GlobalKey<FormState>();

  final ctrTextEmail = TextEditingController();

  final ctrTextPassword = TextEditingController();

  onTapKeepConected(bool? value) => update(state.copyWith(hasKeepConected: value));

  onTapObscurePassword() => update(state.copyWith(hasObscurePassword: !state.hasObscurePassword));

  onTapContinue() async {
    if (!formKey.currentState!.validate()) return;
    setLoading(true);
    final response = await _makeLogin(ctrTextEmail.text, ctrTextPassword.text);
    response.fold(setError, (r) {
      Modular.to.navigate("/");
      setLoading(false);
    });
  }

  Future<Either<FailureApp, UserEntity>> _makeLogin(String email, String password) async =>
      _usecaseLogin(email, password);
}
