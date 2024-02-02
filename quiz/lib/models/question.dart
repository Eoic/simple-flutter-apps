typedef Answer = ({
   int id,
   String text,
});

class Question {
   final String text;
   final List<Answer> answers;
   final int correctAnswerId;
   List<Answer> get shuffledAnswers {
      var answers = List.of(this.answers);
      answers.shuffle();
      return answers;
   }

   const Question({
      required this.text,
      required this.answers,
      required this.correctAnswerId,
   });
}
