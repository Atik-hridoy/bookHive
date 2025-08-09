// lib/app/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Light Color Scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006874),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF97F0FF),
    onPrimaryContainer: Color(0xFF001F24),
    secondary: Color(0xFF4A6267),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCDE7EC),
    onSecondaryContainer: Color(0xFF051F23),
    tertiary: Color(0xFF525E7D),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFDAE2FF),
    onTertiaryContainer: Color(0xFF0E1B37),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    outline: Color(0xFF6F797A),
    background: Color(0xFFFAFDFD),
    onBackground: Color(0xFF191C1D),
    surface: Color(0xFFFAFDFD),
    onSurface: Color(0xFF191C1D),
    surfaceContainerHighest: Color(0xFFDBE4E6),
    onSurfaceVariant: Color(0xFF3F484A),
  );

  // Dark Color Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF4FD8EB),
    onPrimary: Color(0xFF00363D),
    primaryContainer: Color(0xFF004F58),
    onPrimaryContainer: Color(0xFF97F0FF),
    secondary: Color(0xFFB1CBD0),
    onSecondary: Color(0xFF1C3438),
    secondaryContainer: Color(0xFF334B4F),
    onSecondaryContainer: Color(0xFFCDE7EC),
    tertiary: Color(0xFFBAC6EA),
    onTertiary: Color(0xFF24304D),
    tertiaryContainer: Color(0xFF3B4664),
    onTertiaryContainer: Color(0xFFDAE2FF),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    outline: Color(0xFF899294),
    background: Color(0xFF191C1D),
    onBackground: Color(0xFFE1E3E3),
    surface: Color(0xFF191C1D),
    onSurface: Color(0xFFE1E3E3),
    surfaceContainerHighest: Color(0xFF3F484A),
    onSurfaceVariant: Color(0xFFBFC8CA),
  );

  // Text Themes
  static TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        letterSpacing: 0.1,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
        letterSpacing: 0.4,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        letterSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        letterSpacing: 0.5,
      ),
    );
  }

  static lightTheme(ColorScheme lightColorScheme) {
    return ThemeData(
      colorScheme: lightColorScheme,
      textTheme: textTheme(lightColorScheme),
    );
  }

  static darkTheme(ColorScheme darkColorScheme) {
    return ThemeData(
      colorScheme: darkColorScheme,
      textTheme: textTheme(darkColorScheme),
    );
  }

  // Card Theme

  // AppBar Theme

  // Button Theme

  // Elevated Button Theme

 
}

  // AppBar Theme

  // Button Theme

  // Elevated Button Theme

 
