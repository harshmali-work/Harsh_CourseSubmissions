import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/places.dart';

// 1. Light Color Scheme
final lightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF0066FF),
  brightness: Brightness.light,
  surface: Colors.white,
  onSurface: const Color(0xFF1A1D20),
  primary: const Color(0xFF0066FF),
  secondary: const Color(0xFF00A389),
  error: const Color(0xFFFF3B30),
);

// 2. Dark Color Scheme
final darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF0066FF),
  brightness: Brightness.dark,
  surface: const Color(0xFF121619), // Dark surface color
  onSurface: const Color(0xFFF0F4F8), // Light text for dark mode
  primary: const Color(0xFF3384FF),   // Slightly brighter blue for dark mode visibility
  secondary: const Color(0xFF00C7A9),
  error: const Color(0xFFFF453A),
);

// 3. Light Theme
final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: const Color(0xFFF6F8FA),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: lightColorScheme.onSurface,
    elevation: 0,
    scrolledUnderElevation: 1,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: lightColorScheme.onSurface,
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: Color(0xFFE5E9F0)),
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
    titleLarge: TextStyle(fontWeight: FontWeight.bold, color: lightColorScheme.onSurface),
    titleMedium: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2C3E50)),
    titleSmall: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF2C3E50)),
    bodyLarge: const TextStyle(color: Color(0xFF2C3E50)),
    bodyMedium: const TextStyle(color: Color(0xFF4A5568)),
    bodySmall: const TextStyle(color: Color(0xFF718096)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
    ),
  ),
);

// 4. Dark Theme
final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: const Color(0xFF0B0E11), // Deep dark background
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFF121619),
    foregroundColor: darkColorScheme.onSurface,
    elevation: 0,
    scrolledUnderElevation: 1,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: darkColorScheme.onSurface,
    ),
  ),
  cardTheme: CardThemeData(
    color: const Color(0xFF121619),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: Color(0xFF2A2E33)),
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
    titleLarge: TextStyle(fontWeight: FontWeight.bold, color: darkColorScheme.onSurface),
    titleMedium: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFD0D7DE)),
    titleSmall: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFFD0D7DE)),
    bodyLarge: const TextStyle(color: Color(0xFFD0D7DE)),
    bodyMedium: const TextStyle(color: Color(0xFF94A3B8)),
    bodySmall: const TextStyle(color: Color(0xFF64748B)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF121619),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF2A2E33)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF2A2E33)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: darkColorScheme.primary, width: 2),
    ),
  ),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, // Automatically switches based on device setting
      home: const PlacesScreen(),
    );
  }
}