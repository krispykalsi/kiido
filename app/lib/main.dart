import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: KiidoApp()));
}

class KiidoApp extends StatelessWidget {
  const KiidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiido',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: const Color(0xFF16181d),
      ),
      home: const HomeScreen(),
    );
  }
}
