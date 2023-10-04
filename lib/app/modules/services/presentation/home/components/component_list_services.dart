// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admiserv_adm/app/core/domain/entites/service_entity.dart';
import 'package:admiserv_adm/app/modules/services/presentation/home/widgets/widget_card_service.dart';

import 'component_list_filter_service.dart';

class ComponentListServices extends StatelessWidget {
  final SttsListServices stts;
  const ComponentListServices({
    Key? key,
    required this.stts,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (stts.services == null) return Container();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 80),
      child: ListView(shrinkWrap: true, children: [
        Text("Serviços", style: Theme.of(context).textTheme.headlineLarge),
        Text("Esses são os serviços vinculados a sua empresa, edite-os se desejar",
            style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 10),
        ComponentListFilterService(stts: stts.sttsFilter),
        const Divider(),
        if (stts.services!.isEmpty)
          const Center(child: Text("Não há serviços"))
        else
          ...stts.services!.map((e) => WidgetCardService(service: e, onTapEditService: stts.onTapEditService)).toList()
      ]),
    );
  }
}

class SttsListServices {
  List<ServiceEntity>? services;
  SttsListFilterService sttsFilter;
  Function(ServiceEntity) onTapEditService;
  SttsListServices({
    this.services,
    required this.sttsFilter,
    required this.onTapEditService,
  });
}
