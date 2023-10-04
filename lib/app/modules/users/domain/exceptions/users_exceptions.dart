import '../../../../core/domain/exceptions/failure_app.dart';

class FailureCreateUser extends FailureApp {
  final String _message;

  FailureCreateUser(this._message);

  @override
  String get message => _message;
}
