import 'package:flutter/material.dart';
import 'package:quiz_assignment/data/questions.dart';
import 'package:quiz_assignment/screens/questions_screen.dart';
import 'package:quiz_assignment/screens/results_screen.dart';
import 'package:quiz_assignment/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});


  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Store selected answers
  List<String> selectedAnswers = [];
  var _activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void chosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }

  void returnToStartScreen() {
    setState(() {
      _activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: chosenAnswer,
      );
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.teal],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          //If it is start-screen then startscreen should be yielded if it is true,
          // QuestionsScreen if it is false.
          child: screenWidget,
        ),
      ),
    );
  }
}
