
import 'package:flutter/material.dart';

class SystemButton extends StatelessWidget {
  const SystemButton(this.answer, this.onPressed, {super.key});

  final String answer;
  final void Function() onPressed;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6, top: 6),
      child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12,
              horizontal: 4),
              backgroundColor: const Color.fromARGB(255, 79, 81, 82),
              foregroundColor: Colors.white,
            ),
            child: Text(answer, textAlign: TextAlign.center,),
          ),
    );
  }
}