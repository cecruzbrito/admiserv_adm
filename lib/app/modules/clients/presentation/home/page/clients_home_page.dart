import 'package:admiserv_adm/app/core/presentation/states/core_outlet_page/core_outlet_page.dart';
import 'package:flutter/material.dart';

import '../store/clients_home_store.dart';
import '../widgets/widget_button_add_client.dart';

class ClientsHomePage extends StatefulWidget {
  const ClientsHomePage({super.key, required this.store});
  final ClientsHomeStore store;

  @override
  State<ClientsHomePage> createState() => _ClientsHomePageState();
}

class _ClientsHomePageState extends CoreOutletPage<ClientsHomePage> {
  _ClientsHomePageState() : super(title: "Adminserv - Clientes");

  ClientsHomeStore get store => widget.store;

  @override
  Scaffold configScaffold() => Scaffold(floatingActionButton: WidgetButtonAddClient(onTap: store.onTapAddClient));

  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
