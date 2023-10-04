// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admiserv_adm/app/modules/services/presentation/home/store/services_home_state.dart';

class ComponentListFilterService extends StatelessWidget {
  const ComponentListFilterService({super.key, required this.stts});
  final SttsListFilterService stts;
  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: stts.filters
            .map((e) =>
                ChoiceChip(onSelected: (value) => stts.onTapChip(e, value), label: Text(e.label), selected: e.selected))
            .toList());
  }
}

class SttsListFilterService {
  final List<SttsChipFilter> filters;
  final Function(SttsChipFilter, bool?) onTapChip;
  SttsListFilterService({required this.filters, required this.onTapChip});
}
