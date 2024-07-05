import 'package:flutter/material.dart';
import 'package:totem_test/screens/splash_screen.dart';

void main() {
  runApp(const TotemApp());
}

class TotemApp extends StatelessWidget {
  const TotemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TotemApp',
      home: SplashScreen(),
    );
  }
}
