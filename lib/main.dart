import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/screens/splash_screen.dart';
import 'package:totem_test/services/utlis.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Utils.initCategories();
  await Utils.initProducts();
  await Utils.initExtras();

  runApp(const ProviderScope(child: TotemApp()));
}

class TotemApp extends StatelessWidget {
  const TotemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TotemApp',
      home: SplashScreen(),
    );
  }
}
