import 'package:dice_roll/dice_roller.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> colors;

  const GradientContainer({super.key, required this.colors});

  const GradientContainer.purple({super.key}) : colors = const <Color>[
    Colors.blue,
    Colors.indigo,
    Colors.deepPurple,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
