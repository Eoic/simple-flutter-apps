import 'package:flutter/material.dart';
import '../models/answer_summary.dart';

class AnswersSummary extends StatelessWidget {
  final List<AnswerSummary> answersSummary;

  const AnswersSummary(this.answersSummary, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: answersSummary.map((AnswerSummary summary) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: summary.isCorrect ? Colors.blueAccent.shade400 : Colors.purpleAccent.shade400,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(child: Text(summary.order.toString(),),),
                ),
                const SizedBox(width: 16, ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(summary.question, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      Text(summary.chosenAnswer, style: const TextStyle(color: Color.fromARGB(195, 255, 180, 255)),),
                      Text(summary.correctAnswer, style: TextStyle(color: Colors.lightBlueAccent.shade100),),
                      const SizedBox(height: 8,)
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
