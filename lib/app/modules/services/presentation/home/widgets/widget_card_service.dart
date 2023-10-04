// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admiserv_adm/app/core/domain/entites/service_entity.dart';
import 'package:intl/intl.dart';

class WidgetCardService extends StatelessWidget {
  final ServiceEntity service;
  final Function(ServiceEntity) onTapEditService;

  const WidgetCardService({
    Key? key,
    required this.service,
    required this.onTapEditService,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: IconButton(onPressed: () => onTapEditService(service), icon: const Icon(Icons.edit)),
        leading: const Icon(Icons.work),
        title: Text(service.desc),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (service.daysToMaintenance != null) Text("Tempo pra manutenção: ${service.daysToMaintenance} dias"),
            Text(
                "Criado em: ${DateFormat("dd/MM/yyyy").format(service.dateCreated)} às ${DateFormat("hh:mm:ss").format(service.dateCreated)}"),
            const Divider(),
            Text("Status: ${service.hasEnabled ? "Ativo" : "Desativo"}")
          ],
        ),
      ),
    );
  }
}
