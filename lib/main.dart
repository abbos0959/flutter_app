import 'package:advanced/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 18, 173, 21),
            Color.fromARGB(255, 18, 173, 21),
          ])),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
