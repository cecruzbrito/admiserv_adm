import 'package:admiserv_adm/app/core/domain/entites/user_entity.dart';
import 'package:flutter/foundation.dart';

class MainSingleton {
  UserEntity? _user;
  UserEntity? get user {
    if (_user != null) return _user;
    if (kDebugMode) {
      return UserEntity(
          nome: "Carlos Eduardo",
          id: "LXWQh3xM5uUJPUqGmF5ybdVpffE2",
          idCompany: "ezG1F2XAu9UfJf5hfXLZ",
          email: "cecruzbrito@gmail.com",
          hasEnabled: true,
          permissions: null);
    }
    return _user;
  }

  set setUser(UserEntity value) => _user = value;

  void singOut() => _user == null;
}
