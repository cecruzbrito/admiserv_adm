// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admiserv_adm/app/core/domain/entites/service_entity.dart';

class ServicesHomeState {
  List<ServiceEntity>? allServices;
  List<SttsChipFilter> filters;
  ServicesHomeState({this.allServices, required this.filters});

  static ServicesHomeState initialState = ServicesHomeState(filters: [
    SttsChipFilter(index: 0, label: "Serviços ativos", selected: false, indexs: [1]),
    SttsChipFilter(index: 1, label: "Serviços desativos", selected: false, indexs: [0]),
    SttsChipFilter(index: 2, label: "Há manutenção", selected: false, indexs: [3]),
    SttsChipFilter(index: 3, label: "Sem manutenção", selected: false, indexs: [2]),
  ]);

  ServicesHomeState copyWith({
    List<ServiceEntity>? allServices,
    List<SttsChipFilter>? filters,
  }) {
    return ServicesHomeState(
      allServices: allServices ?? this.allServices,
      filters: filters ?? this.filters,
    );
  }
}

class SttsChipFilter {
  final int index;
  final String label;
  bool selected;
  final List<int>? indexs;
  SttsChipFilter({
    required this.index,
    required this.label,
    required this.selected,
    this.indexs,
  });

  void changeSelected(bool? value) => selected = (value ?? selected);
}
