import 'package:flutter/material.dart';

import 'color_schemes.g.dart';

final lightTheme = _generateTheme(lightColorScheme);

final darkTheme = _generateTheme(darkColorScheme);

ThemeData _generateTheme(ColorScheme schema) => ThemeData(
    useMaterial3: true,
    colorScheme: schema,
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: schema.surface,
      indicatorColor: schema.secondaryContainer,
      unselectedLabelTextStyle: TextStyle(color: schema.onSurfaceVariant),
      selectedLabelTextStyle: TextStyle(color: schema.onSurface),
      selectedIconTheme: IconThemeData(color: schema.onSecondaryContainer),
      unselectedIconTheme: IconThemeData(color: schema.onSurfaceVariant),
    ),
    chipTheme: ChipThemeData(
        backgroundColor: schema.surface,
        labelStyle: TextStyle(color: schema.onSurface),
        iconTheme: IconThemeData(color: schema.primary)),
    iconTheme: IconThemeData(color: schema.onSecondaryContainer),
    snackBarTheme: SnackBarThemeData(
        backgroundColor: schema.inverseSurface, contentTextStyle: TextStyle(color: schema.onInverseSurface)));
