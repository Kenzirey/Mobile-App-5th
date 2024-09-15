import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(this.index, this.isCorrect, {super.key});

  final int index;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    //To start from question 1 instead 0, as index initially starts from 0.
    final questionNumber = index + 1;

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color.fromARGB(255, 28, 210, 55)
            : const Color.fromARGB(255, 219, 14, 49),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
