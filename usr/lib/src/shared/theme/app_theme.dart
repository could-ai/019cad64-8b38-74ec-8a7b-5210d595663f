import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0F172A), // Enterprise Blue/Slate
      primary: const Color(0xFF0F172A),
      secondary: const Color(0xFF334155),
      surface: const Color(0xFFF8FAFC),
      background: const Color(0xFFF1F5F9),
    ),
    scaffoldBackgroundColor: const Color(0xFFF1F5F9),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF0F172A)),
      titleTextStyle: TextStyle(
        color: Color(0xFF0F172A),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Color(0xFF0F172A)),
      unselectedIconTheme: IconThemeData(color: Color(0xFF94A3B8)),
      labelType: NavigationRailLabelType.all,
      selectedLabelTextStyle: TextStyle(
        color: Color(0xFF0F172A),
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: Color(0xFF94A3B8),
        fontSize: 12,
      ),
    ),
  );
}
