import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {

  //Just a default start value.
  var currentRoll = 1;

  void rollDice() {
    setState((){
      currentRoll = randomizer.nextInt(6)+1;
    });

  }

  @override
  Widget build(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset('assets/images/dice-$currentRoll.png', width: 200),
          const SizedBox(
            height: 14,
          ),
          TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                foregroundColor: Colors.cyan,
                textStyle: const TextStyle(fontSize: 28)),
            child: const Text('Roll Sigve Down a Hill'),
          )
        ]);
  }
}
