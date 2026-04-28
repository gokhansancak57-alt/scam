import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryNeon = Color(0xFF00F2FF);
  static const Color secondaryNeon = Color(0xFF7000FF);
  static const Color accentPink = Color(0xFFFF00D4);
  static const Color background = Color(0xFF050505);
  static const Color surface = Color(0xFF121212);
  static const Color glassBorder = Color(0x33FFFFFF);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF888888);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: primaryNeon,
        secondary: secondaryNeon,
        surface: surface,
        onSurface: textPrimary,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.orbitron(
          color: textPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 34,
          letterSpacing: 2.0,
        ),
        titleMedium: GoogleFonts.inter(
          color: textSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: textPrimary,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: glassBorder),
          ),
        ),
      ),
    );
  }
}
