import 'package:flutter/material.dart';
import 'package:quiz_assignment/data/questions.dart';
import 'package:quiz_assignment/screens/game_over_screen.dart';
import 'package:quiz_assignment/screens/questions_screen.dart';
import 'package:quiz_assignment/screens/results_screen.dart';
import 'package:quiz_assignment/screens/start_screen.dart';

///Manages overall Quiz state, and handles user interaction within the quiz screens.
class Quiz extends StatefulWidget {
  const Quiz({super.key});


  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

/// The State class for [Quiz] which handles change to the quiz state,
/// through user interaction.
class _QuizState extends State<Quiz> {
  // Store selected answers
  List<String> selectedAnswers = [];

  // The default start screen of the app.
  var _activeScreen = 'start-screen';

  /// Switches the screen to the questions part of the quiz, where user will
  /// read questions and pick from a set of four answers.
  void switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  /// The question chosen by the user.
  /// Will keep adding answers to a list, until the length is equal to the length of all questions.
  /// Then it will change state to results-screen.
  void chosenAnswer(String answer) {
  selectedAnswers.add(answer);

  if (selectedAnswers.length == questions.length) {
    int correctCount = 0;
    for (int i = 0; i < questions.length; i++) {
      // Check if the selected answer matches the first answer in the answers list
      // As the first answer is always the correct one.
      if (questions[i].answers[0] == selectedAnswers[i]) {
        correctCount++;
      }
    }

    // Change the active screen based on the number of correct answers
    setState(() {
      if (correctCount >= 2) {
        _activeScreen = 'results-screen';
      } else {
        _activeScreen = 'game-over-screen';
      }
    });
  }
}
  /// When triggered, it will return user to the first question of question list.
  /// It will also reset the selectedAnswers list.
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }
  //TODO: Implement this again.
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

    if (_activeScreen == 'game-over-screen') {
      screenWidget = GameOverScreen(restartQuiz);
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
          child: screenWidget,
        ),
      ),
    );
  }
}
