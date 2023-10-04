import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/domain/entites/service_entity.dart';
import '../../../../../core/presentation/states/core_outlet_page/core_outlet_page.dart';
import '../store/service_create_edit_state.dart';
import '../store/service_create_edit_store.dart';
import '../widgets/widget_form_create_service.dart';

class ServiceCreateEditPage extends StatefulWidget {
  const ServiceCreateEditPage({super.key, this.serviceEdit, required this.store});
  final ServiceCreateEditStore store;
  final ServiceEntity? serviceEdit;
  @override
  State<StatefulWidget> createState() => _ServiceCreateEditPageState();
}

class _ServiceCreateEditPageState extends CoreOutletPage<ServiceCreateEditPage> {
  _ServiceCreateEditPageState() : super(title: "Adminserv - Gerenciar Serviço");
  ServiceCreateEditStore get store => widget.store;

  @override
  void initState() {
    super.initState();
    store.observer(onError: setError, onLoading: setLoading);
    store.getServiceForEdit(widget.serviceEdit);
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
        child: TripleBuilder<ServiceCreateEditStore, ServiceCreateEditState>(
            store: store,
            builder: (_, trp) {
              return WidgetFormCreateService(
                stts: SttsFormCreateService(
                    onTapVoltar: store.onTapVoltar,
                    onChangeEnable: store.onChangeEnable,
                    hasEdit: trp.state.service != null,
                    hasEnabled: trp.state.hasEnabled,
                    formKey: store.formKey,
                    onTapAdicionar: () => store.onTapContinuar(setSucess),
                    hasMaintain: trp.state.hasMaintain,
                    onChangeMaintain: store.onChangeMaintain,
                    ctrDescServ: store.ctrDescServ,
                    ctrTempoMaintein: store.ctrTempoMaintein),
              );
            }));
  }
}
