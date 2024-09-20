import 'package:flutter/material.dart';

/// The button used for picking answers for the questions in the quiz.
class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answer, this.onPressed, {super.key});

  final String answer;
  final void Function() onPressed;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14,
              horizontal: 25),
              backgroundColor: const Color.fromARGB(255, 35, 96, 96),
              foregroundColor: Colors.white,
            ),
            child: Text(answer, textAlign: TextAlign.center,),
          ),
    );
  }
}