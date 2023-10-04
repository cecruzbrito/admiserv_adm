import 'package:admiserv_adm/app/modules/users/domain/usecases/get_users/users_usecase_get_users.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/domain/entites/user_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';
import '../../../domain/entites/user_db_entity.dart';
import '../../../domain/usecases/edit_user/users_usecase_edit_user.dart';
import 'users_home_state.dart';

class UsersHomeStore extends Store<UsersHomeState> {
  final UsersUsecaseEditUser _usecaseEditUser;
  final UsersUsecaseGetUsers _usecaseGetUsers;
  UsersHomeStore(this._usecaseGetUsers, this._usecaseEditUser) : super(UsersHomeState.initialState);

  Future<Either<FailureApp, List<UserDBEntity>>> _callUsecaseGetUsers() => _usecaseGetUsers();

  Future<Either<FailureApp, void>> _callUsecaseEditUser(UserEntity newUser) => _usecaseEditUser(newUser);

  initialGetUsers() async {
    setLoading(true);
    final response = await _callUsecaseGetUsers();
    setLoading(false);
    response.fold(setError, (r) => update(state.copyWith(users: r)));
  }

  _generateCallback(bool value) => Modular.to.pop(value);

  alertOnTapPositive() => _generateCallback(true);

  alertOnTapNegative() => _generateCallback(false);

  onTapAdicionar() => Modular.to.pushNamed("/users/create");

  onTapOnChangeUser(
      bool? value, UserEntity user, Future<bool?> Function() dialog, Function(String) callBackSuccess) async {
    if (value == null) return;
    final responseDialog = await dialog();
    if (responseDialog == null) return;
    if (!responseDialog) return;
    setLoading(true);
    final response = await _callUsecaseEditUser(user.copyWith(hasEnabled: value));
    setLoading(false);

    response.fold(setError, (r) {
      callBackSuccess("Usuario editado com sucesso");
      initialGetUsers();
    });
  }
}
