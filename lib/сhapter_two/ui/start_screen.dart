import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
                'https://img.freepik.com/premium-vector/quiz-logo-or-poll-questionnaire-icon-symbol_101884-1076.jpg',
                width: 300,
                height: 300,
                fit: BoxFit.cover),
          ),
          const SizedBox(height: 25),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: startQuiz,
            icon: const Icon(Icons.start),
            label: const Text('start'),
          ),
        ],
      ),
    );
  }
}
