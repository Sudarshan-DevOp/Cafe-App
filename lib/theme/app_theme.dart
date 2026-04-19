import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF553722);
  static const Color surface = Color(0xFFfff9ec);
  static const Color tertiary = Color(0xFF771c00);
  static const Color onSurface = Color(0xFF1e1c10);
  static const Color onPrimary = Color(0xFFffffff);
  static const Color onTertiary = Color(0xFFffffff);
  static const Color secondaryContainer = Color(0xFFece0dc);
  static const Color surfaceContainerHighest = Color(0xFFe9e2d0);
  static const Color surfaceContainerLow = Color(0xFFfaf3e0);
  static const Color surfaceContainerLowest = Color(0xFFffffff);
  static const Color outlineVariant = Color(0xFFd4c3ba);
  static const Color onSecondaryContainer = Color(0xFF6b6360);
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.primary,
        onSecondary: AppColors.onPrimary,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        error: const Color(0xFFba1a1a),
        onError: Colors.white,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        outline: AppColors.outlineVariant,
        surfaceContainerHighest: AppColors.surfaceContainerHighest,
        surfaceContainerLow: AppColors.surfaceContainerLow,
        surfaceContainerLowest: AppColors.surfaceContainerLowest,
      ),
      scaffoldBackgroundColor: AppColors.surface,
      fontFamily: 'Plus Jakarta Sans',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Noto Serif',
          fontSize: 24,
          color: AppColors.primary,
        ),
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.tertiary,
          foregroundColor: AppColors.onTertiary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Noto Serif',
          fontSize: 56,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
          height: 1.1,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Noto Serif',
          fontSize: 42,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
          height: 1.2,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Noto Serif',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Noto Serif',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Noto Serif',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 18,
          color: AppColors.onSecondaryContainer,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 16,
          color: AppColors.onSecondaryContainer,
          height: 1.5,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}