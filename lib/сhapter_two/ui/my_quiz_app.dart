import 'package:edemy_app/%D1%81hapter_two/ui/result_screen.dart';
import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import 'start_screen.dart';
import 'questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // with init State:Widget? activeScreen;
  /* @override
  with init State: 
  void initState() {
    activeScreen = WelcomeScreen(startQuiz: change);
    super.initState();
  } */
  // with initState:
  // activeScreen = const QuestionsScreen();

  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  void change() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    setState(() {
      if (selectedAnswers.length == questions.length) {
        activeScreen = 'results-screen';
      }
    });
  }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    /*var activeWidget = activeScreen == 'start-screen'
        ? WelcomeScreen(startQuiz: change)
        : const QuestionsScreen(); */
    Widget activeWidget = StartScreen(startQuiz: change);
    if (activeScreen == 'questions-screen') {
      activeWidget = QuestionsScreen(onSelectedAnswers: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      activeWidget = ResultsScreen(
          chosenAnswers: selectedAnswers, restartQuiz: restartQuiz);
    }

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.indigo),
      home: Scaffold(
        body: Center(
          child: activeWidget,
          /*activeScreen == 'start-screen'
              ? WelcomeScreen(startQuiz: change)
              : const QuestionsScreen(), */
        ),
      ),
    );
  }
}
