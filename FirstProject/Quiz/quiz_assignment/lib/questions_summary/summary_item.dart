import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_assignment/questions_summary/question_identifiert.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    //Check if user answer is the same as the correct answer.
    final isCorrect = itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //I used positionals not named parameters.
        //Remember that the question_index and others are OBJECT type, so need to tell
        //dart what type we expect it to be, in this case int.
        QuestionIdentifier(
          itemData['question_index'] as int,
          isCorrect,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                itemData['user_answer'] as String,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                itemData['correct_answer'] as String,
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
