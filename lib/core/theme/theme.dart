import 'package:flutter/material.dart';

ThemeData getTheme() {
  const primaryColor = Color(0xFFE01E69);
  const accentColor = Color(0xFFE01E69);
  final minimumButtonSize = Size(120, 50);

  return ThemeData(
    accentColor: primaryColor,
    primaryColor: accentColor,
    accentColorBrightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionColor: primaryColor.withOpacity(0.5),
      selectionHandleColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: Colors.white,
        minimumSize: minimumButtonSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(16.0),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  );
}
