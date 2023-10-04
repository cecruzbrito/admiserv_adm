import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/presentation/states/core_outlet_page/core_outlet_page.dart';
import '../components/component_list_filter_service.dart';
import '../components/component_list_services.dart';
import '../store/services_home_state.dart';
import '../store/services_home_store.dart';
import '../widgets/widget_button_add_service.dart';

class ServicesHomePage extends StatefulWidget {
  const ServicesHomePage({super.key, required this.store});
  final ServicesHomeStore store;
  @override
  State<ServicesHomePage> createState() => _ServicesHomePageState();
}

class _ServicesHomePageState extends CoreOutletPage<ServicesHomePage> {
  _ServicesHomePageState() : super(title: "Adiminserv - Serviços");

  ServicesHomeStore get store => widget.store;

  @override
  void initState() {
    super.initState();
    store.observer(onError: setError, onLoading: setLoading);
    store.initialGetServices();
  }

  @override
  Scaffold? configScaffold() =>
      Scaffold(floatingActionButton: WidgetButtonAddService(onTapAddService: store.onTapAddService));
  @override
  Widget body(BuildContext context) {
    return TripleBuilder<ServicesHomeStore, ServicesHomeState>(
        store: store,
        builder: (_, trp) => ComponentListServices(
            stts: SttsListServices(
                onTapEditService: store.onTapEditService,
                sttsFilter: SttsListFilterService(filters: trp.state.filters, onTapChip: store.onTapChip),
                services: store.services)));
  }
}
