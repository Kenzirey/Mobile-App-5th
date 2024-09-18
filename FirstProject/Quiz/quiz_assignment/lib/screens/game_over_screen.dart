import 'package:flutter/material.dart';
import 'package:quiz_assignment/buttons/system_buttons.dart';
import 'package:google_fonts/google_fonts.dart';

/// If a user has too few correct answers, this screen will be triggered.
class GameOverScreen extends StatelessWidget {
  const GameOverScreen(this.onRestart, {super.key});

  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Not enough correct answers 👎',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Image.asset(
            'assets/images/game-over.jpg',
            width: screenWidth,
          ),
          const SizedBox(
            height: 50,
          ),
          SystemButton(onPressed: onRestart, text: 'Try Again')
        ],
      ),
    );
  }
}
