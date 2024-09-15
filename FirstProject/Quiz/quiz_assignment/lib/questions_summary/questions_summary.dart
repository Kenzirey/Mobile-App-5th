import 'package:flutter/material.dart';
import 'package:quiz_assignment/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
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
