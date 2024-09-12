import 'package:flutter/material.dart';
import 'package:quiz_assignment/questions_screen.dart';
import 'package:quiz_assignment/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }


  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

  if (activeScreen == 'questions-screen') {
    screenWidget = const QuestionsScreen();
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
