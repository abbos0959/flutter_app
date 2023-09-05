import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(
    this.summaryData, {
    super.key,
  });
  final List<Map<String, Object>> summaryData;

  // final bool numCorrectQuestioncheck;
  @override
  Widget build(BuildContext context) {
    final List<int> abbos = [];
    final List<String> abbos2 = [];

    final numCorrectQuestioncheck = summaryData
        .where((element) => element["correct"] == element["user_javob"]);

    for (Map<String, Object> q in numCorrectQuestioncheck) {
      int questionIndex = (q["question_index"] as int) + 1;
      abbos.add(questionIndex);

      // Ma'lumotlarni ishlatish
      // print(questionIndex);
    }
    for (Map<String, Object> q in numCorrectQuestioncheck) {
      String questionIndex = q["user_javob"] as String;
      abbos2.add(questionIndex);

      // Ma'lumotlarni ishlatish
      // print(questionIndex);
    }
    return SizedBox(
      height: 330,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((val) {
            return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 30.0, // Aylana o'lchami
                height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Aylana shakli
                  color: (abbos.contains(((val["question_index"]) as int) + 1))
                      ? Colors.blue
                      : Colors.red, // Aylana rangi
                ),
                child: Center(
                  child: Text(((val["question_index"] as int) + 1).toString()),
                ),
              ),
              const SizedBox(width: 10), // Elementlar orasida bo'shlik qo'shing

              Expanded(
                child: Column(
                  children: [
                    Text(val["question"] as String),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      val["user_javob"] as String,
                      style: TextStyle(
                          color: abbos2.contains(val["user_javob"])
                              ? Colors.yellow
                              : Colors.red),
                    ),
                    Text(
                      val["correct"] as String,
                      style: const TextStyle(color: Colors.yellow),
                    ),
                  ],
                ),
              )
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
