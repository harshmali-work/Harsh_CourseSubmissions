import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/places.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: const Color.fromARGB(255, 56, 49, 66),
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: ThemeData().textTheme.copyWith(
    titleSmall: ThemeData().textTheme.titleSmall!.copyWith(
      color: colorScheme.onBackground,
    ),
    titleMedium: ThemeData().textTheme.titleMedium!.copyWith(
      color: colorScheme.onBackground,
    ),
    titleLarge: ThemeData().textTheme.titleLarge!.copyWith(
      color: colorScheme.onBackground,
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