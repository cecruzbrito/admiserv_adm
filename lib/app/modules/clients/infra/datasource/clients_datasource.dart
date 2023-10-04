import '../../domain/entities/client_entity.dart';

abstract class ClientsDatasource {
  Future<List<ClientEntity>> getClients();

  Future<void> addClient(
      {required String name, required String address, required String phone1, required String phone2});

  Future<void> editClient(ClientEntity oldClient, ClientEntity newClient);
}
