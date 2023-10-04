import 'package:admiserv_adm/app/modules/home/presentation/home_routes/components/drawer/store/sidebar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'store/sidebar_store.dart';

class ComponentHomeSideBar extends StatefulWidget {
  const ComponentHomeSideBar({super.key});

  @override
  State<ComponentHomeSideBar> createState() => _ComponentHomeSideBarState();
}

class _ComponentHomeSideBarState extends State<ComponentHomeSideBar> {
  SideBarStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return TripleBuilder<SideBarStore, SideBarState>(
        store: store,
        builder: (_, trp) {
          return Row(
            children: [
              NavigationRail(
                  minWidth: 85,
                  onDestinationSelected: store.onSelectedItem,
                  labelType: NavigationRailLabelType.all,
                  groupAlignment: 0,
                  destinations: store.itens
                      .map((e) => NavigationRailDestination(
                          icon: Icon(e.iconDisable), label: Text(e.label), selectedIcon: Icon(e.iconEnable)))
                      .toList(),
                  selectedIndex: trp.state.selectedItem),
              const VerticalDivider()
            ],
          );
        });
  }
}
