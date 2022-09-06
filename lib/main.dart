import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lobsters/di/locator.dart';
import 'package:lobsters/screens/homescreen.dart';

void main() {
  configureDependencies();
  runApp(const ProviderScope(child: LobstersApp()));
}

class LobstersApp extends StatelessWidget {
  const LobstersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lobste.rs",
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
        ),
        cardColor: const Color(0xFF1E1E1E),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[600],
          backgroundColor: const Color(0xFF1E1E1E),
        ),
      ),
    );
  }
}
