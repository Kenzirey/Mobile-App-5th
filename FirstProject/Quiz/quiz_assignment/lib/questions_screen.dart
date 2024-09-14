import 'package:flutter/material.dart';
import 'package:quiz_assignment/answer_button.dart';
import 'package:quiz_assignment/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_assignment/system_buttons.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});
  //final VoidCallback returnToStart;

  //naming scheme "on"-something is used when it expects a function.
  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void questionAnswered(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
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
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ...currentQuestion.getShuffled().map((item) {
                    return AnswerButton(item, () {
                      questionAnswered(item);
                    });
                  }),
                ],
              ),
            ),
            const SizedBox(
                height: 30), // This can be adjusted for optimal spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SystemButton('Restart Quiz', restartQuiz),

                //Todo: redo the main menu button.
                //SystemButton('Main Menu', widget.returnToStart),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
