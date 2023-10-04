import 'package:dartz/dartz.dart';

import '../../../../core/domain/exceptions/failure_app.dart';
import '../../domain/entities/client_entity.dart';
import '../../domain/repositories/clients_repository.dart';
import '../datasource/clients_datasource.dart';

class ClientsRepositoryImp extends ClientsReposity {
  final ClientsDatasource _datasource;

  ClientsRepositoryImp(this._datasource);
  @override
  Future<Either<FailureApp, void>> addClient(
      {required String name, required String address, required String phone1, required String phone2}) async {
    try {
      return Right(await _datasource.addClient(name: name, address: address, phone1: phone1, phone2: phone2));
    } on FailureApp catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<FailureApp, void>> editClient(ClientEntity oldClient, ClientEntity newClient) async {
    try {
      return Right(await _datasource.editClient(oldClient, newClient));
    } on FailureApp catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<FailureApp, List<ClientEntity>>> getClients() async {
    try {
      return Right(await _datasource.getClients());
    } on FailureApp catch (e) {
      return Left(e);
    }
  }
}
