import 'package:flutter/material.dart';

class QuestionInditifier extends StatelessWidget {
  const QuestionInditifier(
      {super.key, required this.isCorrectAnswer, required this.questionIndex});
  final bool isCorrectAnswer;
  final int questionIndex;
  @override
  Widget build(BuildContext context) {
    final index = questionIndex + 1;
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isCorrectAnswer ? Colors.greenAccent : Colors.pink),
      child: Center(
        child: Text(
          index.toString(),
        ),
      ),
    );
  }
}
