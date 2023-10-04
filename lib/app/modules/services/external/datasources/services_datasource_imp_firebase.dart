import 'package:admiserv_adm/app/modules/login/domain/exceptions/login_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/domain/entites/service_entity.dart';
import '../../../../core/domain/exceptions/failure_app.dart';
import '../../../../core/external/models/service_model.dart';
import '../../../../core/main_singleton/main_singleton.dart';
import '../../domain/exceptions/services_expections.dart';
import '../../infra/datasources/services_datasource.dart';

class ServicesDatasourceImpFirebse implements ServicesDatasource {
  final FirebaseFirestore _db;
  final MainSingleton _singleton;

  ServicesDatasourceImpFirebse(this._db, this._singleton);
  @override
  Future<void> addService(String descServ, {int? timeMaintein}) async {
    try {
      if (_singleton.user == null) throw FailureUserNotExist();
      final newService = ServiceModel.addService(descServ, daysToMaintenance: timeMaintein);
      final reference = _db.collection("company").doc(_singleton.user!.idCompany).collection("services");
      await reference.add(newService.toMap());
    } on FirebaseException {
      throw FailureDefault();
    } on FailureApp {
      rethrow;
    }
  }

  @override
  Future<void> editService(ServiceEntity oldService, ServiceEntity newService) async {
    try {
      if (oldService == newService) throw FailureServiceEditIdentical();
      if (_singleton.user == null) throw FailureUserNotExist();

      final reference = _db.collection("company").doc(_singleton.user!.idCompany).collection("services");
      await reference.doc(oldService.id).update(ServiceModel.fromEntity(newService).toMap());
    } on FirebaseException {
      throw FailureDefault();
    } on FailureApp {
      rethrow;
    }
  }

  @override
  Future<List<ServiceEntity>> getServices() async {
    try {
      if (_singleton.user == null) throw FailureUserNotExist();
      final reference = _db.collection("company").doc(_singleton.user!.idCompany).collection("services");
      final docs = await reference.get();
      return docs.docs.map((e) => ServiceModel.fromMap(e.data(), e.id)).toList();
    } on FirebaseException {
      throw FailureDefault();
    }
  }
}
