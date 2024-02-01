import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatelessWidget {
  final void Function() onStartQuiz;

  const LandingScreen(this.onStartQuiz, {super.key});

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
              style: GoogleFonts.robotoFlex(
                fontSize: 20,
                color: Colors.purple.shade100,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedButton.icon(
              onPressed: onStartQuiz,
              label: const Text('Start a quiz!'),
              icon: const Icon(Icons.arrow_right_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
