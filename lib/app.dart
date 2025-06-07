import 'package:flutter/material.dart';
import 'package:flutter_bloc_examples/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Examples',
      themeMode: ThemeMode.dark,
      theme: _lightThemeData(),
      darkTheme: _darkThemeData(),
      home: const HomeScreen(),
    );
  }

  ThemeData _darkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.tealAccent,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme:  AppBarTheme(
        // backgroundColor: Color(0xFF1E1E1E),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
      ),
    );
  }

  ThemeData _lightThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo.shade800),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.indigo.shade800,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 16),
      ),
    );
  }
}
