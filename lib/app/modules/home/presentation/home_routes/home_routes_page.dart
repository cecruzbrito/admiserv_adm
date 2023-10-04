import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/presentation/states/core_scaffold/core_scaffold_page.dart';
import 'components/drawer/component_home_sidebar.dart';

class HomeRoutesPage extends StatefulWidget {
  const HomeRoutesPage({super.key});

  @override
  State<HomeRoutesPage> createState() => _HomeRoutesPageState();
}

class _HomeRoutesPageState extends CoreState<HomeRoutesPage> {
  _HomeRoutesPageState() : super(title: "Adminserv");

  @override
  Widget body(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ComponentHomeSideBar(),
        Expanded(
            child: Container(padding: const EdgeInsets.only(left: 20, top: 40, right: 20), child: const RouterOutlet()))
      ],
    );
  }
}
