// ignore_for_file: public_member_api_docs, sort_constructors_first
class UsersCreateEditState {
  final bool hasShowPassword;
  final bool hasShowConfirmPassword;
  UsersCreateEditState({
    required this.hasShowPassword,
    required this.hasShowConfirmPassword,
  });
  static UsersCreateEditState initialState = UsersCreateEditState(hasShowConfirmPassword: true, hasShowPassword: true);

  UsersCreateEditState copyWith({
    bool? hasShowPassword,
    bool? hasShowConfirmPassword,
  }) {
    return UsersCreateEditState(
      hasShowPassword: hasShowPassword ?? this.hasShowPassword,
      hasShowConfirmPassword: hasShowConfirmPassword ?? this.hasShowConfirmPassword,
    );
  }
}
