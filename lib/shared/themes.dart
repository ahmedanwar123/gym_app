import 'package:flutter/material.dart';

final ColorScheme kLightColorScheme = ThemeData().colorScheme.copyWith(
      primary: Colors.black,
      secondary: Colors.white,
      tertiary: const Color(0xFF8F959E),
      background: const Color(0xFFFEFEFE),
      error: const Color(0xFFEA4335),
    );

final ThemeData kTheme = ThemeData().copyWith();

final ThemeData kLightTheme = kTheme.copyWith(
  colorScheme: kLightColorScheme,
);

final ThemeData kDarkTheme = kTheme.copyWith();
