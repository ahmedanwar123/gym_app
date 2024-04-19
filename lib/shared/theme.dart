import 'package:flutter/material.dart';

final ColorScheme kColorScheme = ThemeData().colorScheme.copyWith(
      primary: Colors.black,
      secondary: Colors.white,
      tertiary: const Color(0xFFFFB853),
      background: Color.fromARGB(99, 139, 28, 28),
      error: const Color(0xFFEA4335),
    );

final ThemeData kTheme = ThemeData().copyWith();

final ThemeData kColorTheme = kTheme.copyWith(
  colorScheme: kColorScheme,
);
