import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/places.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF0066FF), // Energetic primary blue
  brightness: Brightness.light,       // Force light mode
  background: const Color(0xFFF6F8FA), // Crisp, slightly warm white
  surface: Colors.white,
  onBackground: const Color(0xFF1A1D20), // Dark charcoal for text
  onSurface: const Color(0xFF1A1D20),
  primary: const Color(0xFF0066FF),
  secondary: const Color(0xFF00A389),  // Fresh teal accent
  error: const Color(0xFFFF3B30),
);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: colorScheme.onBackground,
    elevation: 0,
    scrolledUnderElevation: 1,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: colorScheme.onBackground,
    ),
  ),
  cardTheme: CardThemeData( // <-- Change this from CardTheme to CardThemeData
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: Color(0xFFE5E9F0)),
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
    titleLarge: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.onBackground),
    titleMedium: TextStyle(fontWeight: FontWeight.w600, color: const Color(0xFF2C3E50)),
    titleSmall: TextStyle(fontWeight: FontWeight.w500, color: const Color(0xFF2C3E50)),
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
      borderSide: BorderSide(color: colorScheme.primary, width: 2),
    ),
  ),
);

void main() {
  runApp(
    // ProviderScope is required for Riverpod to work
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
      theme: theme,
      home: const PlacesScreen(), // Sets the initial screen
    );
  }
}