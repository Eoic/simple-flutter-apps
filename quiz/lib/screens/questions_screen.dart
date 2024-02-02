import '../models/question.dart';
import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/components/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(Answer answer) onSelectAnswer;
  final void Function() onEndQuiz;

  const QuestionsScreen(this.onSelectAnswer, this.onEndQuiz, {super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(Answer answer) {
    if (currentQuestionIndex + 1 < questions.length) {
      widget.onSelectAnswer(answer);
      setState(() => currentQuestionIndex += 1);
    } else {
      widget.onEndQuiz();
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
                style: GoogleFonts.robotoFlex(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ...questions[currentQuestionIndex]
                  .shuffledAnswers
                  .map((answer) => AnswerButton(text: answer.text, onTap: () => answerQuestion(answer)))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
