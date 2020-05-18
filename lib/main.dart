import 'package:flutter/material.dart';
import 'screens/initialscreen.dart';

void main() {
  runApp(Inicial());
}

class Inicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
      theme: ThemeData.light(),
    );
  }
}
