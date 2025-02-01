import 'package:flutter/material.dart';

// 🌞 Light Theme
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Color(0xFF8E44AD), // Deep Blue
  scaffoldBackgroundColor: Color(0xFFFAF3E0), // Soft Beige
  colorScheme: ColorScheme.light(
    primary: Color(0xFF8E44AD), // Deep Blue
    secondary: Color(0xFFFF6B35), // Sunset Orange
    surface: Colors.white,
    background: Color(0xFFFAF3E0),
    error: Color(0xFFDC2626),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color(0xFF333333),
    onBackground: Color(0xFF333333),
    onError: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF8E44AD),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF333333)), // Dark Gray Text
    headlineMedium: TextStyle(
      color: Color(0xFF8E44AD),
      fontWeight: FontWeight.bold,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFF8E44AD)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFF8E44AD)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFF8E44AD), width: 2),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF6B35), // Sunset Orange
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF8E44AD),
      padding: EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);

// 🌙 Dark Theme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Color(0xFF0F172A), // Midnight Blue
  scaffoldBackgroundColor: Color(0xFF121212), // Dark Gray
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF0F172A), // Midnight Blue
    secondary: Color(0xFFFFA500), // Neon Orange
    surface: Color(0xFF1E1E1E),
    background: Color(0xFF121212),
    error: Color(0xFFEF4444),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color(0xFFE5E5E5),
    onBackground: Color(0xFFE5E5E5),
    onError: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF0F172A),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFE5E5E5)), // Light Gray Text
    headlineMedium: TextStyle(
      color: Color(0xFFE5E5E5),
      fontWeight: FontWeight.bold,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF1E1E1E),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFF3B3B3B)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFF3B3B3B)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFFFFA500), width: 2),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFFA500), // Neon Orange
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF0F172A),
      padding: EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
