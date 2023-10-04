import 'package:admiserv_adm/app/modules/services/presentation/home/store/services_home_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/domain/entites/service_entity.dart';
import '../../../../../core/domain/exceptions/failure_app.dart';
import '../../../domain/usecases/get_services/services_usecase_get_services.dart';

class ServicesHomeStore extends Store<ServicesHomeState> {
  final ServicesUsecaseGetServices _usecaseGetServices;

  ServicesHomeStore(this._usecaseGetServices) : super(ServicesHomeState.initialState);

  List<ServiceEntity>? get services {
    if (state.allServices == null) return null;
    if (state.allServices!.isEmpty) return state.allServices;
    if (state.filters.every((e) => !e.selected)) return state.allServices;

    var aux = state.allServices!.toList();

    for (var f in state.filters.where((e) => e.selected)) {
      if (f.index == 0) aux.removeWhere((e) => !e.hasEnabled);
      if (f.index == 1) aux.removeWhere((e) => e.hasEnabled);
      if (f.index == 2) aux.removeWhere((e) => e.daysToMaintenance == null);
      if (f.index == 3) aux.removeWhere((e) => e.daysToMaintenance != null);
    }
    return aux;
  }

  Future<Either<FailureApp, List<ServiceEntity>>> _callUsecaseGetServices() async => await _usecaseGetServices();

  initialGetServices() async {
    setLoading(true);
    final response = await _callUsecaseGetServices();
    setLoading(false);
    response.fold((l) => null,
        (r) => update(state.copyWith(allServices: r..sort((a, b) => b.dateCreated.compareTo(a.dateCreated)))));
  }

  ServicesHomeState _changeFilter(SttsChipFilter newChip) => state.copyWith(
      filters: state.filters
        ..removeAt(newChip.index)
        ..insert(newChip.index, newChip));

  void onTapChip(SttsChipFilter chip, bool? value) {
    update(_changeFilter(chip..changeSelected(value)));
    if (chip.indexs == null) return;
    if (value! == false) return;
    for (var v in chip.indexs!) {
      var newChip = state.filters.firstWhere((e) => e.index == v);
      update(_changeFilter(newChip..changeSelected(false)));
    }
  }

  onTapEditService(ServiceEntity service) => Modular.to.pushNamed("/services/edit", arguments: service);

  onTapAddService() => Modular.to.pushNamed("/services/create");
}
