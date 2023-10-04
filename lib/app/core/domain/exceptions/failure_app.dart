abstract class FailureApp implements Exception {
  String get message;
}

class FailureDefault extends FailureApp {
  final String msg;
  FailureDefault({this.msg = "Ocorreu um erro, tente novamente"});
  @override
  String get message => msg;
}
