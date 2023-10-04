import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class GuardEditServices extends RouteGuard {
  GuardEditServices() : super(redirectTo: "/services");

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) => Modular.args.data != null;
}
