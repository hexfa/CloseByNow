import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorsManagement.primary,
      onPrimary: ColorsManagement.onPrimary,
      primaryContainer: ColorsManagement.primaryContainer,
      onPrimaryContainer: ColorsManagement.onPrimaryContainer,
      secondary: ColorsManagement.secondary,
      onSecondary: ColorsManagement.onSecondary,
      error: ColorsManagement.error,
      onError: ColorsManagement.onError,
      background: ColorsManagement.background,
      onBackground: ColorsManagement.onBackground,
      surface: ColorsManagement.surface,
      onSurface: ColorsManagement.onSurface,
      shadow: ColorsManagement.shadow,
      outline: ColorsManagement.outline,
    ),
  );
}
