import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  final void Function() startQuiz;

  const LandingScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(200, 255, 255, 255),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.purple.shade100,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedButton.icon(
              onPressed: () => startQuiz(),
              label: const Text('Start a quiz!'),
              icon: const Icon(Icons.arrow_right_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
