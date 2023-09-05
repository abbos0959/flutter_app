import 'package:advanced/data/savollar.dart';
import 'package:advanced/question.dart';
import 'package:advanced/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:advanced/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedansvers = [];

  var activeScreen = "start_screen";

  void changeSctiveScreen() {
    setState(() {
      activeScreen = "question_screen";
    });
  }

  void changeSctiveScreen2() {
    setState(() {
      selectedansvers = [];
      activeScreen = "question_screen";
    });
  }

  void chooiseansvers(String answer) {
    selectedansvers.add(answer);

    if (selectedansvers.length == question.length) {
      // selectedansvers = [];
      setState(() {
        activeScreen = "result_screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(changeSctiveScreen);
    if (activeScreen == "question_screen") {
      screenWidget = Question(onSelectAnswer: chooiseansvers);
    }
    if (activeScreen == "result_screen") {
      screenWidget = Result(
          chooseAnsvers: selectedansvers,
          changeSctiveScreen: changeSctiveScreen2);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 18, 173, 21),
              Color.fromARGB(255, 18, 173, 21),
            ])),
            child: screenWidget),
      ),
    );
  }
}
