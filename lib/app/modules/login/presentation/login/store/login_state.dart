// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginState {
  final String? email;
  final String? password;
  final bool hasObscurePassword;
  final bool hasKeepConected;
  LoginState({this.email, this.password, this.hasObscurePassword = true, this.hasKeepConected = false});

  static LoginState initialState = LoginState();

  LoginState copyWith({
    String? email,
    String? password,
    bool? hasObscurePassword,
    bool? hasKeepConected,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      hasObscurePassword: hasObscurePassword ?? this.hasObscurePassword,
      hasKeepConected: hasKeepConected ?? this.hasKeepConected,
    );
  }
}
