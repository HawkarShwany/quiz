import 'Question.dart';
import 'package:flutter/material.dart';

class QuizBrain {
  int _qnum = 0;
  int _score = 0;
  final String _type;

  QuizBrain(this._type);

  List<Question> _generalQuestions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  List<Question> _scienceQuestions = [
    Question('Some cats are actually allergic to humans', true),
    Question('A slug\'s blood is green.', true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
  ];

  List<Question> _sportsQuestions = [];

  bool isFinished() {
    if (_type == 'General') {
      if (_qnum < _generalQuestions.length - 1) {
        return false;
      } else {
        return true;
      }
    }else if (_type == 'Science') {
      if (_qnum < _scienceQuestions.length - 1) {
        return false;
      } else {
        return true;
      }
    }else{
      return null;
    }
  }

  void reset() {
    _qnum = 0;
    _score = 0;
  }

  void nextQuestion() {
    if (_type == 'General') {
      if (_qnum < _generalQuestions.length - 1) {
        _qnum++;
      }
    } else if (_type == 'Science') {
      if (_qnum < _scienceQuestions.length - 1) {
        _qnum++;
      }
    }
  }

  String getQuestionText() {
    if (_type == 'General') {
      return _generalQuestions[_qnum].questionText;
    } else if (_type == 'Science') {
      return _scienceQuestions[_qnum].questionText;
    } else {
      return null;
    }
  }

  bool getQuestionAnswer() {
    if (_type == 'Science') {
      return _scienceQuestions[_qnum].questionAnswer;
    } else if (_type == 'General') {
      return _generalQuestions[_qnum].questionAnswer;
    } else {
      return null;
    }
  }

  int numberOfQuestions() {
    if (_type == 'General') {
      return _generalQuestions.length;
    } else if (_type == 'Science') {
      return _scienceQuestions.length;
    } else {
      return null;
    }
  }

  Icon checkAnswer(bool ans) {
    bool correctAns = getQuestionAnswer();
    if (ans == correctAns) {
      _score++;
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }

  int getScore() {
    return _score;
  }
}
