// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'sidebar_state.dart';

class SideBarStore extends Store<SideBarState> {
  SideBarStore() : super(SideBarState.initalState);
  final itens = [
    SideBarItens(
        label: "Home",
        index: 0,
        path: "/",
        iconDisable: Icons.home_outlined,
        iconEnable: Icons.home,
        moduleName: "/home"),
    SideBarItens(
        label: "Servicos",
        index: 1,
        path: "/services/",
        iconDisable: Icons.work_outlined,
        iconEnable: Icons.work,
        moduleName: "/services"),
    SideBarItens(
        label: "Usuários",
        index: 2,
        path: "/users/",
        iconDisable: Icons.group_outlined,
        iconEnable: Icons.group,
        moduleName: "/users"),
    SideBarItens(
        label: "Clientes",
        index: 3,
        path: "/clients/",
        iconDisable: Icons.groups_outlined,
        iconEnable: Icons.groups,
        moduleName: "/clients"),
  ];

  void onSelectedItem(int index) {
    try {
      if (state.selectedItem == index) return;
      final response = itens.firstWhere((e) => e.index == index);
      Modular.to.pushNamed(response.path);
      if (response.callback != null) response.callback!();

      update(state.copyWith(selectedItem: index));
    } catch (e) {
      return;
    }
  }

  @override
  void initStore() {
    super.initStore();
    checkSelectedIndex();
  }

  void checkSelectedIndex() {
    final response = itens.firstWhere((e) {
      return Modular.to.navigateHistory.last.name.contains(e.moduleName);
    }, orElse: () => itens.first);
    update(state.copyWith(selectedItem: response.index));
  }
}

class SideBarItens {
  final String label;
  final String path;
  final String moduleName;
  final int index;
  final IconData iconDisable;
  final IconData iconEnable;
  Function()? callback;

  SideBarItens(
      {required this.label,
      required this.path,
      required this.moduleName,
      required this.index,
      required this.iconDisable,
      required this.iconEnable,
      this.callback});
}
