import 'package:edemy_app/%D1%81hapter_two/data/questions_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/question_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswers});
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();

  final void Function(String answer) onSelectedAnswers;
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswers(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
    // currentQuestionIndex += 1;
    // currentQuestionIndex = currentQuestionIndex + 1;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final data = questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.1, vertical: height * 0.05),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            data.text,
            style:
                GoogleFonts.aBeeZee(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          ...data.shuffledAnswers.map((answer) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: QuestionButton(
                text: answer,
                onTap: () => answerQuestion(answer),
              ),
            );
          }),
        ],
      ),
    );
  }
}
