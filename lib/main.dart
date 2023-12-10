import 'package:blcak_jack/screens/black_jack_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//This is a comment from the Aother
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home:BlackJackScreen(),
    );
  }
}
