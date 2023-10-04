import 'package:admiserv_adm/app/core/domain/exceptions/failure_app.dart';

class FailureLogin extends FailureApp {
  final String _message;

  FailureLogin(this._message);

  @override
  String get message => _message;
}

class FailureUserNotExist extends FailureApp {
  @override
  String get message => "O usuario não existe.";
}

class FailureUserCredentials extends FailureApp {
  final String _message;

  FailureUserCredentials(this._message);
  @override
  String get message => _message;
}

class FailureUserDisable extends FailureApp {
  @override
  String get message => "O usuario não possui a permissão de continuar.";
}

class FailureCompanyDoesntExist extends FailureApp {
  @override
  String get message => "A sua atual empresa não existe.";
}

class FailureCompanyDisable extends FailureApp {
  @override
  String get message => "A empresa não possui a permissão de continuar.";
}
