import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../main_singleton/main_singleton.dart';

class GuardAuthUser extends RouteGuard {
  GuardAuthUser() : super(redirectTo: "/login/");
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    var tryGet = Modular.tryGet<MainSingleton>();
    if (tryGet == null) return false;
    return tryGet.user != null;
  }
}
