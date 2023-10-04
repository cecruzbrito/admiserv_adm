import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'clients_home_state.dart';

class ClientsHomeStore extends Store<ClientsHomeState> {
  ClientsHomeStore() : super(ClientsHomeState.initialState);

  onTapAddClient() => Modular.to.pushReplacementNamed("/clients/add");
}
