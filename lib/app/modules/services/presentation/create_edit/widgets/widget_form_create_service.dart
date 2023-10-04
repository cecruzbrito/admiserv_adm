// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/mixins/mixins_form_field.dart';

class WidgetFormCreateService extends StatelessWidget with MixinFormField {
  WidgetFormCreateService({super.key, required this.stts});
  final SttsFormCreateService stts;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: stts.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stts.hasEdit ? "Edite serviço" : "Adicionar serviço",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            stts.hasEdit
                ? "Altere qualquer campo e submita a edição"
                : "Insira as informações do serviço e as altere quando precisar",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: stts.ctrDescServ,
            validator: validatorEmpty,
            decoration: const InputDecoration(
              labelText: "Descrição do serviço",
              hintText: "Digite a descrição do serviço",
              prefixIcon: Icon(Icons.work),
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: !stts.hasMaintain ? null : validatorEmpty,
                  controller: stts.ctrTempoMaintein,
                  enabled: stts.hasMaintain,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: "Tempo para manutenção do serviço",
                    hintText: "Digite o tempo em dias",
                    suffixText: "(em dias)",
                    prefixIcon: Icon(Icons.schedule),
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Switch(value: stts.hasMaintain, onChanged: stts.onChangeMaintain),
                  Text(
                    "Há manutenção?",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
          if (stts.hasEdit) const SizedBox(height: 20),
          if (stts.hasEdit)
            SwitchListTile(
              value: stts.hasEnabled!,
              onChanged: stts.onChangeEnable,
              title: const Text("Manter o serviço ativo"),
            ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              FilledButton(onPressed: stts.onTapAdicionar, child: const Text("Continuar")),
              OutlinedButton(onPressed: stts.onTapVoltar, child: const Text("Voltar")),
            ],
          )
        ],
      ),
    );
  }
}

class SttsFormCreateService {
  final bool hasMaintain;
  final bool hasEdit;
  final bool? hasEnabled;
  final Function(bool?) onChangeMaintain;
  final Function(bool?) onChangeEnable;
  final Function() onTapAdicionar;
  final Function() onTapVoltar;
  final TextEditingController ctrDescServ;
  final TextEditingController ctrTempoMaintein;
  final GlobalKey<FormState> formKey;
  SttsFormCreateService({
    required this.hasMaintain,
    required this.hasEdit,
    this.hasEnabled,
    required this.onChangeMaintain,
    required this.onChangeEnable,
    required this.onTapAdicionar,
    required this.onTapVoltar,
    required this.ctrDescServ,
    required this.ctrTempoMaintein,
    required this.formKey,
  });
}
