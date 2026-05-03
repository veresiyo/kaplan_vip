import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1F3A70);
  static const Color accentColor = Color(0xFFFFA500);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFF44336);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color cardBackground = Colors.white;
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: accentColor,
        error: errorColor,
        surface: backgroundColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 4,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: textSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: textPrimary),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimary),
        headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textPrimary),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textPrimary),
        bodyLarge: TextStyle(fontSize: 16, color: textPrimary),
        bodyMedium: TextStyle(fontSize: 14, color: textPrimary),
        bodySmall: TextStyle(fontSize: 12, color: textSecondary),
      ),
    );
  }
}
