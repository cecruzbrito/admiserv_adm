import 'package:admiserv_adm/app/core/domain/entites/user_entity.dart';
import 'package:admiserv_adm/app/core/domain/exceptions/failure_app.dart';
import 'package:admiserv_adm/app/core/external/models/user_model.dart';
import 'package:admiserv_adm/app/core/main_singleton/main_singleton.dart';
import 'package:admiserv_adm/app/modules/users/external/models/user_db_model.dart';
import 'package:admiserv_adm/app/modules/users/infra/datasources/users_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../login/domain/exceptions/login_exceptions.dart';
import '../../domain/entites/user_db_entity.dart';
import '../../domain/exceptions/users_exceptions.dart';

class UsersDatasourceFirebaseImp implements UsersDatasource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _db;
  final MainSingleton _mainSingleton;

  UsersDatasourceFirebaseImp(this._auth, this._db, this._mainSingleton);
  @override
  Future<void> createUser({required String name, required String email, required String password}) async {
    late UserCredential response;
    try {
      response = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final userModel = UserModel.createUser(
          email: email,
          nome: name,
          password: password,
          id: response.user!.uid,
          idCompany: _mainSingleton.user!.idCompany);
      await _db.collection("user").add(userModel.toMap());
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw FailureCreateUser(_getMsgFirebaseLogin(e));
    } on FirebaseException catch (e) {
      await response.user!.delete();
      print(e.message);
      throw FailureCreateUser("Erro ao criar o usuario.");
    }
  }

  String _getMsgFirebaseLogin(FirebaseAuthException e) => switch (e.code) {
        "email-already-in-use" => "Esse email já está sendo utilizado.",
        "invalid-emai" => "Email invalido.",
        "weak-password" => "Senha fraca.",
        _ => "Erro ao criar o usuario"
      };

  @override
  Future<void> editUser(UserEntity newUser) async {
    try {
      if (_mainSingleton.user == null) throw FailureUserNotExist();
      await _db.collection("user").doc(newUser.id).update(UserModel.fromEntity(newUser).toMap());
    } on FirebaseException catch (e) {
      print(e);
      throw FailureDefault(msg: "Erro ao buscar usuários");
    }
  }

  @override
  Future<List<UserDBEntity>> getUsers() async {
    try {
      if (_mainSingleton.user == null) throw FailureUserNotExist();
      final reference =
          await _db.collection("user").where("id_company", isEqualTo: _mainSingleton.user!.idCompany).get();
      return reference.docs.map((e) => UserDBModel.fromMap(e.data(), e.id)).toList();
    } on FirebaseException catch (e) {
      print(e);
      throw FailureDefault(msg: "Erro ao buscar usuários");
    }
  }
}
