import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/screens/questions_screen.dart';
import 'package:quiz/screens/landing_screen.dart';
import 'package:quiz/screens/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  Widget? activeScreen;
  List<Answer> selectedAnswers = [];

  void startQuiz() {
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer, endQuiz);
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(chooseAnswer, endQuiz);
    });
  }

  void endQuiz() {
    setState(() {
      activeScreen = ResultsScreen(selectedAnswers, restartQuiz);
      selectedAnswers = [];
    });
  }

  void chooseAnswer(Answer answer) {
    selectedAnswers.add(answer);
  }

  @override
  void initState() {
    activeScreen = LandingScreen(startQuiz);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade500,
                Colors.deepPurple.shade700,
                Colors.deepPurple.shade900,
              ],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
