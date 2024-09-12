import 'package:flutter/material.dart';
import 'splash_screens.dart';

void main() {
  runApp(const MarocrideApp());
}

class MarocrideApp extends StatelessWidget {
  const MarocrideApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marocride',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const SplashScreens(),
    );
  }
}