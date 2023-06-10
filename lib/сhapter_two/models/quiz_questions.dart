class QuizQuestions {
  const QuizQuestions({required this.text, required this.answer});
  final String text;
  final List<String> answer;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
