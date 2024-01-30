typedef Answer = ({
   int id,
   String text,
});

class Question {
   final String text;
   final List<Answer> answers;
   final int correctAnswerId;

   const Question({
      required this.text,
      required this.answers,
      required this.correctAnswerId,
   });

   List<Answer> getShuffledAnswers() {
      var answers = List.of(this.answers);
      answers.shuffle();
      return answers;
   }
}
