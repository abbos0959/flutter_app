import 'package:flutter/material.dart';

class AnsversButton extends StatelessWidget {
  const AnsversButton(
      {required this.ansvertext, required this.onTap, super.key});
  final String ansvertext;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        onPressed: onTap,
        // style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        child: Text(
          ansvertext,
          style: const TextStyle(fontSize: 20),
        ));
  }
}
