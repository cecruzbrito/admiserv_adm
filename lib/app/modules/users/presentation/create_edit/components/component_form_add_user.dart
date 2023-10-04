// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admiserv_adm/app/core/mixins/mixins_form_field.dart';

class ComponentFormAddUser extends StatelessWidget with MixinFormField {
  ComponentFormAddUser({super.key, required this.stts});
  final SttsFormAddUser stts;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: stts.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Adicionar usuario",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            "Insira as informações do usuario para continuar",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: stts.ctrTextName,
            validator: validatorEmpty,
            decoration: const InputDecoration(
              labelText: "Nome",
              hintText: "Digite o nome do usuário",
              prefixIcon: Icon(Icons.person),
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: stts.ctrTextEmail,
            validator: validatorEmail,
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Digite o email de acesso do usuário",
              prefixIcon: Icon(Icons.email),
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: stts.hasShowPassword,
            controller: stts.ctrTextPassword,
            validator: validatorEmpty,
            decoration: InputDecoration(
              labelText: "Senha",
              hintText: "Digite a senha de acesso do usuário",
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(stts.hasShowPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: stts.onTapShowPassword,
              ),
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: stts.ctrTextConfirmPassword,
            obscureText: stts.hasShowConfirmPassword,
            validator: (value) => validatorConfirmPassword(value, stts.ctrTextPassword.text),
            decoration: InputDecoration(
              labelText: "Confirme a senha",
              hintText: "Redigite a senha de acesso do usuário",
              prefixIcon: const Icon(Icons.lock),
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(stts.hasShowConfirmPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: stts.onTapShowConfirmPassword,
              ),
            ),
          ),
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
                    onPressed: stts.onTapConfirm,
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

class SttsFormAddUser {
  final TextEditingController ctrTextName;
  final TextEditingController ctrTextEmail;
  final TextEditingController ctrTextPassword;
  final TextEditingController ctrTextConfirmPassword;
  final bool hasShowPassword;
  final Function() onTapShowPassword;
  final bool hasShowConfirmPassword;
  final Function() onTapShowConfirmPassword;
  final Function() onTapConfirm;
  final Function() onTapVoltar;
  final GlobalKey<FormState> formKey;
  SttsFormAddUser({
    required this.ctrTextName,
    required this.ctrTextEmail,
    required this.ctrTextPassword,
    required this.ctrTextConfirmPassword,
    required this.hasShowPassword,
    required this.onTapShowPassword,
    required this.hasShowConfirmPassword,
    required this.onTapShowConfirmPassword,
    required this.onTapConfirm,
    required this.onTapVoltar,
    required this.formKey,
  });
}
