import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/components/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void nextQuestion() {
    if (currentQuestionIndex + 1 < questions.length) {
      setState(() {
        currentQuestionIndex += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questions[currentQuestionIndex].text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ...questions[currentQuestionIndex]
                  .getShuffledAnswers()
                  .map((question) => AnswerButton(text: question.text, onTap: nextQuestion))
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
