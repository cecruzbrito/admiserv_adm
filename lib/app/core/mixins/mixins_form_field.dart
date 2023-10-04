mixin MixinFormField {
  final _defaultMessage = "Campo Obrigatorio";
  String? validatorEmpty(String? value) {
    if (value == null) return _defaultMessage;
    if (value.isEmpty) return _defaultMessage;
    return null;
  }

  String? validatorEmail(String? value) {
    final responseEmpty = validatorEmpty(value);
    if (responseEmpty != null) return responseEmpty;
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
      return "Email invalido";
    }
    return null;
  }

  String? validatorConfirmPassword(String? confirmPassword, String password) {
    final responseEmpty = validatorEmpty(confirmPassword);
    final responsePassEmpty = validatorEmpty(password);
    if (responseEmpty != null || responsePassEmpty != null) return _defaultMessage;
    if (confirmPassword! != password) return "As senhas não coincidem";
    return null;
  }
}
