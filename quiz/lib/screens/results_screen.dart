import 'package:quiz/components/answers_summary.dart';

import '../models/answer_summary.dart';
import '../models/question.dart';
import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  final List<Answer> answers;
  final void Function() restartQuiz;

  const ResultsScreen(this.answers, this.restartQuiz, {super.key});

  (List<AnswerSummary>, int, int) getSummary() {
    final List<AnswerSummary> summary = [];

    for (var i = 0; i < answers.length; i++) {
      summary.add((
        order: i + 1,
        question: questions[i].text,
        isCorrect: questions[i].correctAnswerId == answers[i].id,
        chosenAnswer: answers[i].text,
        correctAnswer: questions[i]
            .answers
            .firstWhere((element) => element.id == questions[i].correctAnswerId)
            .text
      ));
    }

    return (summary, summary.length, countCorrectAnswers(summary));
  }

  int countCorrectAnswers(List<AnswerSummary> summary) {
    return summary.fold(0, (value, answer) => answer.isCorrect ? value + 1 : value);
  }

  @override
  Widget build(BuildContext context) {
    final (summary, totalAnswers, correctAnswers) = getSummary();

    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $totalAnswers questions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(190, 255, 255, 255)
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            AnswersSummary(summary),
            TextButton(
              onPressed: restartQuiz,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.restart_alt_sharp,),
                  SizedBox(width: 8,),
                  Text('Restart quiz!',)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
