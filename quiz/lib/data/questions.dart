import 'package:quiz/models/question.dart';

const questions = [
  Question(
    text: 'What are the main building blocks of Flutter UIs?',
    answers: [
      (id: 1, text: 'Widgets'),
      (id: 2, text: 'Components'),
      (id: 3, text: 'Blocks'),
      (id: 4, text: 'Functions'),
    ],
    correctAnswerId: 1,
  ),
  Question(
    text: 'How are Flutter UIs built.',
    answers: [
      (id: 1, text: 'By combining widgets in code'),
      (id: 2, text: 'By combining widgets in a visual editor'),
      (id: 3, text: 'By defining widgets in config files'),
      (id: 4, text: 'By using XCode for iOS and Android Studio for Android'),
    ],
    correctAnswerId: 1,
  ),
  Question(
    text: 'What\'s the purpose of a StatefulWidget?',
    answers: [
      (id: 1, text: 'Update UI as data changes'),
      (id: 2, text: 'Update data as UI changes'),
      (id: 3, text: 'Ignore data changes'),
      (id: 4, text: 'Render UI that does not depend on data'),
    ],
    correctAnswerId: 1,
  ),
  Question(
    text:
        'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    answers: [
      (id: 1, text: 'StatelessWidget'),
      (id: 2, text: 'StatefulWidget'),
      (id: 3, text: 'Both are equally good'),
      (id: 4, text: 'None of the above'),
    ],
    correctAnswerId: 1,
  ),
  Question(
    text: 'What happens if you change data in a StatelessWidget?',
    answers: [
      (id: 1, text: 'The UI is not updated'),
      (id: 2, text: 'The UI is updated'),
      (id: 3, text: 'The closest StatefulWidget is updated'),
      (id: 4, text: 'Any nested StatefulWidgets are updated'),
    ],
    correctAnswerId: 1,
  ),
  Question(
    text: 'How should you update data inside of StatefulWidgets?',
    answers: [
      (id: 1, text: 'By calling setState()'),
      (id: 2, text: 'By calling updateData()'),
      (id: 3, text: 'By calling updateUI()'),
      (id: 4, text: 'By calling updateState()'),
    ],
    correctAnswerId: 1,
  ),
];
