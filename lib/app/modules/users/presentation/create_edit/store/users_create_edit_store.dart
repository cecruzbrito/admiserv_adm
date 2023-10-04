import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/domain/exceptions/failure_app.dart';
import '../../../domain/usecases/create_user/users_usecase_create_user.dart';
import 'users_create_edit_state.dart';

class UsersCreateEditStore extends Store<UsersCreateEditState> {
  final UsersUsecaseCreateUser _usecaseCreateUser;
  UsersCreateEditStore(this._usecaseCreateUser) : super(UsersCreateEditState.initialState);

  final ctrTextName = TextEditingController();
  final ctrTextEmail = TextEditingController();
  final ctrTextPassword = TextEditingController();
  final ctrTextConfirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<Either<FailureApp, void>> _callCreateUser(
          {required String name, required String email, required String password}) =>
      _usecaseCreateUser(name: name, email: email, password: password);

  void onTapShowPassword() => update(state.copyWith(hasShowPassword: !state.hasShowPassword));

  void onTapShowConfirmPassword() => update(state.copyWith(hasShowConfirmPassword: !state.hasShowConfirmPassword));

  Future<void> onTapConfirm(Function(String) callBackSuccess) async {
    if (!formKey.currentState!.validate()) return;
    setLoading(true);
    final response =
        await _callCreateUser(name: ctrTextName.text, email: ctrTextEmail.text, password: ctrTextPassword.text);
    setLoading(false);
    response.fold(setError, (r) => callBackSuccess("Usuario cadastrado com sucesso"));
  }

  void onTapVoltar() => Modular.to.canPop() ? Modular.to.pop() : Modular.to.pushReplacementNamed("/users/");
}
