import 'package:flutter/material.dart';

import '../widgets/widget_form_login.dart';

class ComponentResposiveLoginLarge extends StatelessWidget {
  const ComponentResposiveLoginLarge({super.key, required this.formWidget});
  final WidgetFormLogin formWidget;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(color: colorScheme.primary),
        ),
        Expanded(child: formWidget)
      ],
    );
  }
}
