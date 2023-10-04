import 'dart:async';

import 'package:admiserv_adm/app/core/main_singleton/main_singleton.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GuardLogin extends RouteGuard {
  GuardLogin() : super(redirectTo: "/");
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    var tryGet = Modular.tryGet<MainSingleton>();
    if (tryGet == null) return true;
    return tryGet.user == null;
  }
}
