import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme(Locale locale) {
    final baseTextTheme = locale.languageCode == 'bn'
        ? GoogleFonts.hindSiliguriTextTheme()
        : GoogleFonts.interTextTheme();

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2E3192),
        primary: const Color(0xFF2E3192),
        secondary: const Color(0xFF1BFFFF),
      ),
      useMaterial3: true,
      textTheme: baseTextTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
