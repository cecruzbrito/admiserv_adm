// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../domain/entites/user_db_entity.dart';

class UsersHomeState {
  final List<UserDBEntity>? users;
  UsersHomeState({this.users});

  static UsersHomeState initialState = UsersHomeState();

  UsersHomeState copyWith({
    List<UserDBEntity>? users,
  }) {
    return UsersHomeState(
      users: users ?? this.users,
    );
  }
}
