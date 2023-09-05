import 'package:advanced/ansvers_button.dart';
import 'package:advanced/data/savollar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answer) onSelectAnswer;
  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  var currentquestionIndex = 0;

  void ansverQuestion(String selectansverquestioncha) {
    widget.onSelectAnswer(selectansverquestioncha);
    setState(() {
      currentquestionIndex = currentquestionIndex + 1;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = question[currentquestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentquestion.getAnsver.map((val) {
            return Center(
              child: Container(
                // height: 10,
                width: double.infinity,
                child: AnsversButton(
                    ansvertext: val,
                    onTap: () {
                      ansverQuestion(val);
                    }),
              ),
            );
          })
        ],
      ),
    );
  }
}
