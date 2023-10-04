import 'package:admiserv_adm/app/modules/clients/domain/entities/client_entity.dart';

class ClientModel extends ClientEntity {
  ClientModel(
      {required super.id, required super.name, required super.address, required super.phone1, required super.phone2});

  factory ClientModel.toMap(String id, Map<String, dynamic> m) =>
      ClientModel(id: id, name: m["name"], address: m["address"], phone1: m["phone1"], phone2: m["phone2"]);

  factory ClientModel.addClient(
          {required String name, required String address, required String phone1, required String phone2}) =>
      ClientModel(address: address, id: "", name: name, phone1: phone1, phone2: phone2);

  toMap() => {"name": name, "address": address, "phone1": phone1, "phone2": phone2};
}
