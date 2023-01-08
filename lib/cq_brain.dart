import 'cq_model.dart';

class CQBrain {

  final List<Model> _questionData = [
    Model(
        question:
            'Prepare a nice yellow gold color omlete',
        choice1: 'beat the eggs',
        choice2: 'fold and serve'),
    Model(
        question: 'Nothing to serve',
        choice1: 'Restart',
        choice2: ''),
    Model(
        question:
            'beaten eggs are ready and we have a pan what to do next',
        choice1: 'melt butter',
        choice2: 'add the beaten eggs to pan'),
    Model(
        question:
            'without butter omlete will get damaged while tossing/folding',
        choice1: 'Restart',
        choice2: ''),
    Model(
        question:
            'butter got melted, what to do next',
        choice1: 'add beaten eggs to pan',
        choice2: 'fold and serve'),
    Model(
        question:
            'omlete turns to nice yellow gold color',
        choice1: 'fold and serve',
        choice2: 'wait for 2 minutes'),
    Model(
        question:
            'Wow! you got a perfect omlete',
        choice1: 'Finish',
        choice2: ''),
    Model(
        question:
            'oops! omlete got burnt',
        choice1: 'Restart',
        choice2: '')
  
  
  ];

  getQuestion() {
    return _questionData[_questionNumber].question;
  }

  getChoice1() {
    return _questionData[_questionNumber].choice1;
  }

 getChoice2() {
    return _questionData[_questionNumber].choice2;
  }


  int _questionNumber = 0;

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _questionNumber == 0) {
      _questionNumber = 2;
    } else if (choiceNumber == 2 && _questionNumber == 0) {
      _questionNumber = 1;
    } else if (choiceNumber == 1 && _questionNumber == 2) {
      _questionNumber = 4;
    } else if (choiceNumber == 2 && _questionNumber == 2) {
      _questionNumber = 3;
    } else if (choiceNumber == 1 && _questionNumber == 4) {
      _questionNumber = 5;
    } else if (choiceNumber == 2 && _questionNumber == 4) {
      _questionNumber = 1;
    }else if (choiceNumber == 1 && _questionNumber == 5) {
      _questionNumber = 6;
    } else if (choiceNumber == 2 && _questionNumber == 5) {
      _questionNumber = 7;
    } else if (_questionNumber == 1 || _questionNumber == 3 || _questionNumber == 6 || _questionNumber == 7) {
      restart();
    }
  }

  void restart() {
    _questionNumber = 0;
  }

  buttonShouldBeVisible() {
    if (_questionNumber == 0 || _questionNumber == 2 || _questionNumber == 4 || _questionNumber == 5) {
      return true;
    } else {
      return false;
    }
  }
}