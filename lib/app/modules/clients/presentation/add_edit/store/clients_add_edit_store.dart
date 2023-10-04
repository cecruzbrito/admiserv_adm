import 'package:admiserv_adm/app/modules/clients/presentation/add_edit/store/clients_add_edit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ClientsAddEditStore extends Store<ClientsAddEditState> {
  ClientsAddEditStore() : super(ClientsAddEditState.initialState);

  final formKey = GlobalKey<FormState>();
  final ctrName = TextEditingController();
  final ctrAddress = TextEditingController();
  final ctrPhone1 = TextEditingController();
  final ctrPhone2 = TextEditingController();

  onTapContinuar() {}
  onTapVoltar() => Modular.to.canPop() ? Modular.to.pop() : Modular.to.pushReplacementNamed("/clients/");
}
