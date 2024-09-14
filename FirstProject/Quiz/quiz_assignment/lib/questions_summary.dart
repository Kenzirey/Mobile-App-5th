import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summary.map((contents){
        return Row(children: [
          Text(((contents['question_index'] as int) + 1).toString()),
          Expanded(
            child: Column(children: [
              Text(contents['question'] as String),
              const SizedBox(height: 7),
              Text(contents['user_answer'] as String),
              Text(contents['correct_answer'] as String),
            ],),
          ),
        ],);
      },).toList(),
    );
  }
}