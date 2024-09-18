import 'package:flutter/material.dart';
import 'package:quiz_assignment/questions_summary/summary_item.dart';

/// A widget that displays a scrollable summary of the quiz.
///
/// Receives it takes a List [summary] of Maps that correspond with summary in ResultsScreen.
/// Creates a [SummaryItem] for very question.
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          // Converts each item (aka contents) as a new SummaryItem.
          // Because .map is Iterable and modifies and returns a new item.
          children: summary.map(
            (contents) {
              return SummaryItem(contents);
            },
          ).toList(),
        ),
      ),
    );
  }
}
