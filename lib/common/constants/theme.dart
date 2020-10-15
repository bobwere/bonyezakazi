import 'package:flutter/material.dart';

final bonyezaTheme = ThemeData(
  colorScheme: colorScheme,
  primaryColor: colorScheme.primary,
  accentColor: colorScheme.secondary,
  backgroundColor: colorScheme.background,
  scaffoldBackgroundColor: colorScheme.background,
);

final ColorScheme colorScheme = ColorScheme.light(
    primary: Color(0xFF0095D8),
    primaryVariant: Color(0xFF00518f),
    secondary: Color(0xFF4433cc),
    secondaryVariant: Color(0xFF1326bc),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFFFFFFF),
    error: Color(0xFF000000),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),
    onBackground: Color(0xFF000000),
    onError: Color(0xFFFD9726),
    brightness: Brightness.light);
