import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/result/result_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "start-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-Screen";
      });
    }
  }

  Widget currentScreen() {
    if (activeScreen == "start-screen") {
      return StartScreen(switchScreen);
    } else if (activeScreen == "questions-screen") {
      return QuestionScreen(onSelectAnswer: chooseAnswer);
    } else {
      return ResultScreen(
          resetScreen: resetQuiz, chosenAnswers: selectedAnswers);
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 105, 39, 176),
                Color.fromARGB(255, 147, 5, 172)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: currentScreen(),
        ),
      ),
    );
  }
}
