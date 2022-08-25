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
    return const MaterialApp(
      title: "Lobste.rs",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
