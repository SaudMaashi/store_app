import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  final primary = const Color(0xFF8E6CEF);
  final secondary = const Color(0xFFF4F4F4);

  static final light = ThemeData(
    useMaterial3: false,
    primaryColor: const Color(0xFF8E6CEF),
    colorScheme: const ColorScheme(
      primary: Color(0xFF8E6CEF),
      primaryContainer: Color(0xFF8E6CEF),
      secondary: Color(0xFF000000),
      secondaryContainer: Color(0xFFFFFFFF),
      surface: Color(0xFF8E6CEF),
      error: Colors.red,
      onPrimary: Color(0xFF8E6CEF),
      onSecondary: Color(0xFF000000),
      onSurface: Color(0xFFFFFFFF),
      onError: Colors.red,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF8E6CEF),
      foregroundColor: Color(0xFF000000),
      elevation: 4.0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF8E6CEF),
      selectedItemColor: Color(0xFFFFFFFF),
      unselectedItemColor: Color(0xFF000000),
    ),
    // ==========================================
    // DONE
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFF8E6CEF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
    // ==========================================
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF000000)),
      displayMedium: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000)),
      bodyLarge: TextStyle(fontSize: 16.0, color: Color(0xFF000000)),
      bodyMedium: TextStyle(fontSize: 14.0, color: Color(0xFF000000)),
      labelLarge: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF000000)),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF8E6CEF),
      size: 24.0,
    ),
//=======================================================
// DONE
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFFF4F4F4),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      enabledBorder: InputBorder.none,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF8E6CEF),
          width: 2,
        ),
      ),
      labelStyle: const TextStyle(color: Color(0xFF8E8E8E)),
      hintStyle: const TextStyle(color: Color(0xFF8E8E8E)),
    ),
//=======================================================
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF8E6CEF),
      foregroundColor: Colors.white,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white),
      fillColor: WidgetStateProperty.all(const Color(0xFF8E6CEF)),
      side: BorderSide.none,
    ),
  );

  static final dark = ThemeData(
    useMaterial3: false,
    primaryColor: const Color(0xFF8E6CEF),
    colorScheme: const ColorScheme(
      primary: Color(0xFF8E6CEF),
      primaryContainer: Color(0xFF8E6CEF),
      secondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0x00000000),
      surface: Color(0xFF8E6CEF),
      error: Colors.red,
      onPrimary: Color(0xFF8E6CEF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF212121),
      onError: Colors.red,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF1D182A),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF8E6CEF),
      foregroundColor: Colors.white,
      elevation: 4.0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF8E6CEF),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFF212121),
    ),
// =================================================
// DONE
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFF8E6CEF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
// =================================================
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFFFFF)),
      displayMedium: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFFFFFF)),
      bodyLarge: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF)),
      bodyMedium: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF)),
      labelLarge: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFFFFF)),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF8E6CEF),
      size: 24.0,
    ),
//=======================================================
// DONE
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFF342F3F),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      enabledBorder: InputBorder.none,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF8E6CEF),
          width: 2,
        ),
      ),
      labelStyle: const TextStyle(color: Color(0xFF8E8E8E)),
      hintStyle: const TextStyle(color: Color(0xFF8E8E8E)),
    ),
//=======================================================
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF8E6CEF),
      foregroundColor: Colors.white,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white),
      fillColor: WidgetStateProperty.all(const Color(0xFF8E6CEF)),
      side: BorderSide.none,
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = AppTheme.light;
  bool _isDark = false;

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData get theme => _theme;

  void toggleTheme() async {
    _isDark = !_isDark;
    _theme = _isDark ? AppTheme.dark : AppTheme.light;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", _isDark);
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool("isDark") ?? false;
    _theme = _isDark ? AppTheme.dark : AppTheme.light;
    notifyListeners();
  }
}
