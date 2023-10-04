import 'package:flutter/material.dart';

class WidgetButtonAddClient extends StatelessWidget {
  const WidgetButtonAddClient({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onTap,
      icon: const Icon(Icons.add),
      label: const Text('Adicionar cliente'),
    );
  }
}
