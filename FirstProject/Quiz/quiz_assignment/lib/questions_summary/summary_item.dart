import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_assignment/questions_summary/question_identifiert.dart';

/// Information about a single question and its accompanying answer.
///
/// Also checks to see if the answer chosen by the user matches the correct answer.
/// Used in the results screenm where each SummaryItem represents each question's summary,
/// question itself, chosen answer by user as well as correct answer.
class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  /// A map that contains a String, which will come from results_screen,
  /// because the getQuizSummary has different data types in it, we use Object,
  /// as it allows both integer and text values.
  /// Writing this for myself, I know documentation should not be this obtuse.
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
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: QuestionIdentifier(
            itemData['question_index'] as int,
            isCorrect,
          ),
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
              // It wanted String interpolation, but can also do it as:
              // ('Your answer: ' + (itemdata etc goes into here))
              // I have them starting left instead of centered, for ease of reading.
              Text('Your Answer: ${itemData['user_answer'] as String}',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14

                ),
              ),
              Text(
                'Correct answer: ${itemData['correct_answer'] as String}',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6,),
            ],
          ),
        ),
      ],
    );
  }
}
