class QuizQuestion {
  const QuizQuestion(this.text, this.javob);

  final String text;
  final List<String> javob;

  List<String> get getAnsver {
    final shuffleList = List.of(javob);
    shuffleList.shuffle();
    return shuffleList;
  }
}
