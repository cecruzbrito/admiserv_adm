import 'dart:async';

import 'package:admiserv_adm/app/core/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Admiserv',
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      theme: lightTheme,
      // themeMode: ThemeMode.light,
      darkTheme: darkTheme,
    );
  }
}
