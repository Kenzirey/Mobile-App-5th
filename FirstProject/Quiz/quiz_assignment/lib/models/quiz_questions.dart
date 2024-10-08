/// Represents model of how the quiz questions should be set up.
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  /// Shuffles the list of answers randomly.
  List<String> getShuffled() {
    final shuffledUpdatedList = List.of(answers);
    shuffledUpdatedList.shuffle();
    return shuffledUpdatedList;
  }
}