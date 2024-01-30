import 'package:flutter/material.dart';
import 'package:quiz/screens/questions_screen.dart';
import 'package:quiz/screens/landing_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  Widget? activeScreen;

  void startQuiz() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
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
