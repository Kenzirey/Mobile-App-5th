import 'package:flutter/material.dart';
import 'package:quiz_assignment/answer_button.dart';
import 'package:quiz_assignment/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_assignment/system_buttons.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.returnToStart, {super.key});
  final VoidCallback returnToStart;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void questionAnswered() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      restartQuiz();
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    currentQuestion.text,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ...currentQuestion.getShuffled().map((item) {
                    return AnswerButton(item, questionAnswered);
                  }),
                ],
              ),
            ),
            const SizedBox(height: 30),  // This can be adjusted for optimal spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SystemButton('Restart Quiz', restartQuiz),
                SystemButton('Main Menu', widget.returnToStart),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
