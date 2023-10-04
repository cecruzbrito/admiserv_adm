import 'package:flutter/material.dart';

class WidgetButtonAddService extends StatelessWidget {
  const WidgetButtonAddService({super.key, required this.onTapAddService});
  final Function() onTapAddService;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onTapAddService,
      icon: const Icon(Icons.add),
      label: const Text('Adicionar serviço'),
    );
  }
}
