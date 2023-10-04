import 'package:dartz/dartz.dart';

import '../../../../core/domain/exceptions/failure_app.dart';
import '../entities/client_entity.dart';

abstract class ClientsReposity {
  Future<Either<FailureApp, List<ClientEntity>>> getClients();

  Future<Either<FailureApp, void>> addClient(
      {required String name, required String address, required String phone1, required String phone2});

  Future<Either<FailureApp, void>> editClient(ClientEntity oldClient, ClientEntity newClient);
}
