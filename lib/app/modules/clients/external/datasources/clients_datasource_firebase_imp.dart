import 'package:admiserv_adm/app/core/main_singleton/main_singleton.dart';
import 'package:admiserv_adm/app/modules/clients/domain/entities/client_entity.dart';
import 'package:admiserv_adm/app/modules/clients/external/models/client_model.dart';
import 'package:admiserv_adm/app/modules/clients/infra/datasource/clients_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientsDatasourceFirebaseImp implements ClientsDatasource {
  final MainSingleton _singleton;
  final FirebaseFirestore _db;

  ClientsDatasourceFirebaseImp(this._singleton, this._db);

  @override
  Future<void> addClient(
      {required String name, required String address, required String phone1, required String phone2}) async {
    var clientModel = ClientModel.addClient(name: name, address: address, phone1: phone1, phone2: phone2);
    await _db.collection("company").doc(_singleton.user!.idCompany).collection("client").add(clientModel.toMap());
  }

  @override
  Future<void> editClient(ClientEntity oldClient, ClientEntity newClient) {
    // TODO: implement editClient
    throw UnimplementedError();
  }

  @override
  Future<List<ClientEntity>> getClients() {
    // TODO: implement getClients
    throw UnimplementedError();
  }
}
