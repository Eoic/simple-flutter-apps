import 'dart:math';
import 'package:flutter/material.dart';

final Random rng = Random.secure();

class DiceRoller extends StatefulWidget {
  const DiceRoller({ super.key });

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  int activeDiceId = 1;

  void rollDice() {
    setState(() {
      activeDiceId = rng.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/dice-$activeDiceId.png",
          width: 200,
        ),
        const SizedBox(
            height: 18.0,
        ),
        ElevatedButton(
          onPressed: () => rollDice(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.fromLTRB(36, 16, 36, 16),
              textStyle: const TextStyle(fontSize: 26)
          ),
          child: const Text("Roll dice"),
        )
      ],
    );
  }
}