import 'package:flutter/material.dart';

import '../../../../../core/mixins/mixins_form_field.dart';

class WidgetFormLogin extends StatelessWidget with MixinFormField {
  WidgetFormLogin({super.key, required this.stts});
  final SttsFormLogin stts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
      child: Form(
        key: stts.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "Insira seus dados para poder continuar",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: stts.ctrTextEmail,
              validator: validatorEmail,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Digite seu email",
                prefixIcon: Icon(Icons.email),
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: stts.ctrTextPassword,
              validator: validatorEmpty,
              obscureText: stts.hasObscurePassword,
              decoration: InputDecoration(
                  labelText: "Senha",
                  hintText: "Digite sua senha",
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(stts.hasObscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: stts.onTapObscurePassword,
                  )),
            ),
            const SizedBox(height: 20),
            Center(
                child: FilledButton(
                    onPressed: stts.onTapContinue,
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15), child: Text("Continuar"))))
          ],
        ),
      ),
    );
  }
}

class SttsFormLogin {
  final TextEditingController ctrTextEmail;
  final TextEditingController ctrTextPassword;
  final Function(bool? value) onTapKeepConected;
  final Function() onTapObscurePassword;
  final Function() onTapContinue;
  final bool hasKeepConected;
  final bool hasObscurePassword;
  final GlobalKey<FormState> formKey;
  SttsFormLogin({
    required this.ctrTextEmail,
    required this.ctrTextPassword,
    required this.onTapKeepConected,
    required this.onTapObscurePassword,
    required this.onTapContinue,
    required this.hasKeepConected,
    required this.hasObscurePassword,
    required this.formKey,
  });
}
