import 'package:flutter/material.dart';

void main() {
  runApp(const KiidoApp());
}

class KiidoApp extends StatelessWidget {
  const KiidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiido',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const Material(
        child: Center(child: Text("Kiido")),
      ),
    );
  }
}
