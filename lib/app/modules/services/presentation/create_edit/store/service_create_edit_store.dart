import 'package:admiserv_adm/app/core/domain/entites/service_entity.dart';
import 'package:admiserv_adm/app/modules/services/domain/usecases/edit_service/service_usecase_edit_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/domain/exceptions/failure_app.dart';
import '../../../domain/usecases/add_service/service_usecase_add_service.dart';
import 'service_create_edit_state.dart';

class ServiceCreateEditStore extends Store<ServiceCreateEditState> {
  final ServicesUsecaseAddService _usecaseAddService;
  final ServicesUsecaseEditService _usecaseEditService;
  ServiceCreateEditStore(this._usecaseAddService, this._usecaseEditService)
      : super(ServiceCreateEditState.initialState);

  final formKey = GlobalKey<FormState>();

  final ctrDescServ = TextEditingController();

  final ctrTempoMaintein = TextEditingController();

  getServiceForEdit(ServiceEntity? service) {
    if (service == null) return;
    ctrDescServ.text = service.desc;
    if (service.daysToMaintenance != null) ctrTempoMaintein.text = "${service.daysToMaintenance}";
    update(state.copyWith(
        service: service, hasMaintain: service.daysToMaintenance != null, hasEnabled: service.hasEnabled));
  }

  void onChangeEnable(bool? value) => update(state.copyWith(hasEnabled: value));

  void onChangeMaintain(bool? value) => update(state.copyWith(hasMaintain: value));

  Future<Either<FailureApp, void>> _callUsecaseAddService(String descServ, {int? timeMaintein}) async =>
      await _usecaseAddService(descServ, timeMaintein: timeMaintein);

  Future<Either<FailureApp, void>> _callUsecaseEditService(ServiceEntity oldService, ServiceEntity newService) =>
      _usecaseEditService(oldService, newService);

  onTapContinuar(Function(String msg) sucessCallback) async {
    if (!formKey.currentState!.validate()) return;

    if (state.service != null) {
      var newService = state.service!.makeCopy(
          desc: ctrDescServ.text,
          hasEnabled: state.hasEnabled!,
          daysToMaintenance: int.tryParse(ctrTempoMaintein.text));
      setLoading(true);
      final response = await _callUsecaseEditService(state.service!, newService);
      setLoading(false);
      response.fold(setError, (r) => sucessCallback("Serviço editado com sucesso"));
    } else {
      setLoading(true);
      final response = state.hasMaintain
          ? await _callUsecaseAddService(ctrDescServ.text, timeMaintein: int.parse(ctrTempoMaintein.text))
          : await _callUsecaseAddService(ctrDescServ.text);
      setLoading(false);

      response.fold(setError, (r) => sucessCallback("Serviço adicionado com sucesso"));
    }
  }

  onTapVoltar() => Modular.to.canPop() ? Modular.to.pop() : Modular.to.pushNamed("/services/");
}
