// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../widgets/widget_form_login.dart';
import 'component_responsive_login_large.dart';
import 'component_responsive_login_medium.dart';

class ComponentLoginCard extends StatelessWidget {
  const ComponentLoginCard({super.key, required this.stts});
  final SttsFormLogin stts;
  @override
  Widget build(BuildContext context) {
    var formLogin = WidgetFormLogin(stts: stts);
    var size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < 650 || size.height < 438) {
        return Center(child: ComponentResposiveLoginMedium(formWidget: formLogin));
      }
      return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: size.height),
          child: ComponentResposiveLoginLarge(formWidget: formLogin));
    });
  }
}
