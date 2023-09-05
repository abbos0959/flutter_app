import 'package:advanced/data/savollar.dart';
import 'package:advanced/models/question_summary.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result(
      {super.key,
      required this.chooseAnsvers,
      required this.changeSctiveScreen});

  final List<String> chooseAnsvers;
  final void Function() changeSctiveScreen;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<Map<String, Object>> get getSummaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < widget.chooseAnsvers.length; i++) {
      summary.add({
        "question_index": i,
        "question": question[i].text,
        "correct": question[i].javob[0],
        "user_javob": widget.chooseAnsvers[i]
      });
    }
    // print("qalesan kalla");
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summarData = getSummaryData();
    final numtotalQuestion = question.length;
    final numCorrectQuestion = getSummaryData
        .where((element) => element["correct"] == element["user_javob"])
        .length;

    return SizedBox(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Siz jami $numtotalQuestion ta savoldan $numCorrectQuestion tasiga to\'g\'ri javob berdingiz ',
              style: const TextStyle(color: Colors.yellow, fontSize: 18),
            ),

            const SizedBox(
              height: 20,
            ),
            QuestionSummary(getSummaryData),
            // const Text("siz nta savoldan m tasiga to'g'ri javob berdingiz"),
            // const SizedBox(
            //   height: 30,
            // ),
            // const Text("javoblar listis"),
            // const SizedBox(
            //   height: 30,
            // ),
            TextButton(
                onPressed: () {
                  widget.changeSctiveScreen();
                },
                child: const Text("qayta ishlash"))
          ],
        ),
      ),
    );
  }
}
