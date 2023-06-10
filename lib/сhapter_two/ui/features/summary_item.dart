import 'package:flutter/material.dart';

import 'question_inditifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});
  final Map<String, Object> itemData;
  final questionStyle = const TextStyle(color: Colors.white, fontSize: 18);
  final correctStyle = const TextStyle(color: Colors.green, fontSize: 18);
  final userAnswerStyle = const TextStyle(color: Colors.red, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        QuestionInditifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  itemData['question'].toString(),
                  style: questionStyle,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                itemData['user_answer'].toString(),
                style: userAnswerStyle,
              ),
              const SizedBox(height: 5),
              Text(
                itemData['correct_answer'].toString(),
                style: correctStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
