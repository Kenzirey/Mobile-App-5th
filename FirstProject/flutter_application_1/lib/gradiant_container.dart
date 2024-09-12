import 'package:flutter/material.dart';
import 'package:flutter_application_1/dice_roller.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.startGradient, this.endGradient, {super.key});
  final Color startGradient;
  final Color endGradient;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            startGradient,
            endGradient,
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        //Can use column to add more items to the child slot,
        //add it just after the child that is inside the position (center)
        child: DiceRoller()
      ),
    );
  }


}
