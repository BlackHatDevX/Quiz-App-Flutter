class QuizQuestion {
  const QuizQuestion(this.question, this.choices);

  final String question;
  final List<String> choices;

  List<String> getShuffledAnswers() {
    final ShuffledList = List.of(choices);
    ShuffledList.shuffle();
    return ShuffledList;
  }
}
