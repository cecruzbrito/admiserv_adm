import 'package:admiserv_adm/app/core/presentation/states/core_outlet_page/core_outlet_page.dart';
import 'package:admiserv_adm/app/modules/clients/presentation/add_edit/store/clients_add_edit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../components/component_form_add_edit_client.dart';
import '../store/clients_add_edit_store.dart';

class ClientsAddEditPage extends StatefulWidget {
  const ClientsAddEditPage({super.key, required this.store});
  final ClientsAddEditStore store;
  @override
  State<ClientsAddEditPage> createState() => _ClientsAddEditPageState();
}

class _ClientsAddEditPageState extends CoreOutletPage<ClientsAddEditPage> {
  _ClientsAddEditPageState() : super(title: "Adminserv - Gerenciar cliente");
  ClientsAddEditStore get store => widget.store;

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: TripleBuilder<ClientsAddEditStore, ClientsAddEditState>(
        store: store,
        builder: (_, trp) => ComponentFormAddEditClient(
          stts: SttsFormAddEditClient(
              formKey: store.formKey,
              ctrName: store.ctrName,
              ctrAddress: store.ctrAddress,
              ctrPhone1: store.ctrPhone1,
              ctrPhone2: store.ctrPhone2,
              onTapContinue: store.onTapContinuar,
              onTapVoltar: store.onTapVoltar),
        ),
      ),
    );
  }
}
