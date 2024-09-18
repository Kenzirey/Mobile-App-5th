import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_assignment/buttons/system_buttons.dart';
import 'package:quiz_assignment/data/questions.dart';
import 'package:quiz_assignment/questions_summary/questions_summary.dart';

/// A screen that shows the results of the quiz (if enough answers were correct).
///
/// It displays:
/// - Total number of correct answers out of total amount of available answers.
/// - chosen answer by user and the correct answer.
/// - A button on the bottom to restart the quiz.
///
/// Passed to the widget via [chosenAnswers], which holds user's chosen answers.
class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  /// Generates a summary of the quiz results.
  ///
  /// - 'question_index' is the index of each question.
  /// - 'question' the question text.
  /// - 'correct_answer' the correct answer of the question, it is always the first answer.
  List<Map<String, Object>> getQuizSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          //key + value pairs go here, the {} is the dart syntax for creating a map.
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final summary = getQuizSummary();
    final numOfQuestions = questions.length;
    final numOfCorrectQuestions = summary.where((data) {

      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $numOfCorrectQuestions correctly, out of $numOfQuestions total questions, I knew you could do it 👍',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              summary,
            ),
            const SizedBox(
              height: 30,
            ),
            SystemButton(onPressed: onRestart, text: 'Restart'),
          ],
        ),
      ),
    );
  }
}
