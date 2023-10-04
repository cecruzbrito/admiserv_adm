import 'package:flutter/material.dart';

import '../widgets/widget_form_login.dart';

class ComponentResposiveLoginMedium extends StatelessWidget {
  const ComponentResposiveLoginMedium({super.key, required this.formWidget});
  final WidgetFormLogin formWidget;
  @override
  Widget build(BuildContext context) {
    return formWidget;
  }
}
