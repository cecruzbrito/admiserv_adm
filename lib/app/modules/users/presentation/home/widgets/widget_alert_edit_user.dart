// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/domain/entites/user_entity.dart';

class WidgetAlertEdit extends AlertDialog {
  const WidgetAlertEdit({
    Key? key,
    required this.user,
    required this.callBackPositive,
    required this.callBackNegative,
  }) : super(key: key);
  final UserEntity user;
  final Function() callBackPositive;
  final Function() callBackNegative;

  @override
  AlertDialog build(BuildContext context) {
    return AlertDialog(
      title: Text("Realmente deseja ${user.hasEnabled ? "inativar" : "ativar"} o(a) ${user.nome}?"),
      content: const Text("Esse status incapacitará o usuario de acessar a aplicação."),
      actions: [
        TextButton(onPressed: callBackNegative, child: const Text("Não")),
        TextButton(onPressed: callBackPositive, child: const Text("Sim")),
      ],
    );
  }
}
