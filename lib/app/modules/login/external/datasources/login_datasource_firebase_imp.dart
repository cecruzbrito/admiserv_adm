import 'package:admiserv_adm/app/core/domain/exceptions/failure_app.dart';
import 'package:admiserv_adm/app/core/external/models/company_model.dart';
import 'package:admiserv_adm/app/core/main_singleton/main_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/domain/entites/user_entity.dart';
import '../../../../core/external/models/user_model.dart';
import '../../domain/exceptions/login_exceptions.dart';
import '../../infra/datasources/login_datasource.dart';

class LoginDatasourceFirebaseImp implements LoginDatasource {
  final FirebaseFirestore db;
  final FirebaseAuth auth;
  final MainSingleton mainSingleton;

  LoginDatasourceFirebaseImp(this.db, this.auth, this.mainSingleton);

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final checkUser = await auth.signInWithEmailAndPassword(email: email, password: password);
      final docUser = (await db.collection("user").doc(checkUser.user!.uid).get());
      if (!docUser.exists) throw FailureUserNotExist();

      var userDb = UserModel.fromMap(docUser.data()!, checkUser.user!.email!, docUser.id);
      if (!userDb.hasEnabled) throw FailureUserDisable();

      final docCompany = (await db.collection("company").doc(userDb.idCompany).get());
      if (!docCompany.exists) throw FailureCompanyDoesntExist();

      final companyModel = CompanyModel.fromMap(docCompany.data()!, docCompany.id);
      if (!companyModel.hasEnabled) throw FailureCompanyDisable();

      return mainSingleton.setUser = (userDb.copyWith(company: companyModel));
    } on FirebaseAuthException catch (e) {
      throw FailureLogin(_formatMsgFirebaseAuthException(e));
    } on FirebaseException catch (e) {
      throw FailureLogin(e.message ?? "Erro ao logar");
    } on FailureApp {
      rethrow;
    }
  }

  String _formatMsgFirebaseAuthException(FirebaseAuthException e) => switch (e.code) {
        "invalid-email" => "Email invalido",
        "invalid-login-credentials" => "Email e/ou senha incorreta(s).",
        "user-not-found" => "Usuario não encontrado",
        "wrong-password" => "Senha incorreta",
        _ => "Erro ao logar"
      };
}
