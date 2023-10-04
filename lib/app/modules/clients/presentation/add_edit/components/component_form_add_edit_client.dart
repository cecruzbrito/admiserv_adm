// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ComponentFormAddEditClient extends StatelessWidget {
  const ComponentFormAddEditClient({super.key, required this.stts});
  final SttsFormAddEditClient stts;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: stts.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Adicionar cliente",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            "Insira as informações do cliente para continuar",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 20),
          TextFormField(
              controller: stts.ctrName,
              decoration: const InputDecoration(
                labelText: "Nome",
                hintText: "Digite o nome do cliente",
                prefixIcon: Icon(Icons.person),
                filled: true,
              )),
          const SizedBox(height: 20),
          TextFormField(
              controller: stts.ctrAddress,
              decoration: const InputDecoration(
                labelText: "Endereço",
                hintText: "Digite o endereço do cliente",
                prefixIcon: Icon(Icons.home),
                filled: true,
              )),
          const SizedBox(height: 20),
          TextFormField(
              controller: stts.ctrPhone1,
              decoration: const InputDecoration(
                labelText: "Telefone 1",
                hintText: "Digite o telefone do cliente",
                prefixIcon: Icon(Icons.phone),
                filled: true,
              )),
          const SizedBox(height: 20),
          TextFormField(
              controller: stts.ctrPhone2,
              decoration: const InputDecoration(
                labelText: "Telefone 2 (opcional)",
                hintText: "Digite um telefone opcional do cliente",
                prefixIcon: Icon(Icons.phone),
                filled: true,
              )),
          const SizedBox(height: 20),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 10,
              spacing: 10,
              children: [
                FilledButton(
                    onPressed: stts.onTapContinue,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text("Continuar"),
                    )),
                OutlinedButton(
                    onPressed: stts.onTapVoltar,
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15), child: Text("Voltar"))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SttsFormAddEditClient {
  final GlobalKey<FormState> formKey;
  final TextEditingController ctrName;
  final TextEditingController ctrAddress;
  final TextEditingController ctrPhone1;
  final TextEditingController ctrPhone2;
  final Function() onTapContinue;
  final Function() onTapVoltar;

  SttsFormAddEditClient({
    required this.formKey,
    required this.ctrName,
    required this.ctrAddress,
    required this.ctrPhone1,
    required this.ctrPhone2,
    required this.onTapContinue,
    required this.onTapVoltar,
  });
}
