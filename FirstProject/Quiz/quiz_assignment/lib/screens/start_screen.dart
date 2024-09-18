import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/people-quiz.png',
            width: 300,
          ),
          const SizedBox(height: 40),
           Text(
            'Learn Flutter the Udemy Way',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text('Start Learning',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 24),),
          )
        ],
      ),
    );
  }
}
