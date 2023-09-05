import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.abbos, {super.key});
  final void Function() abbos;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              "assets/images/quiz-logo.png",
              width: 300,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Bu savol javob application",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: abbos,
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              "Boshlash",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
