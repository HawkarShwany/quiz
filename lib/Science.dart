import 'package:flutter/material.dart';
import 'QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Science extends StatefulWidget {
  @override
  _ScienceState createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  QuizBrain quizBrain = QuizBrain('Science');
  List<Icon> scoreKeeper = [];

  void check(bool ans) {
    
    setState(() {
      scoreKeeper.add(quizBrain.checkAnswer(ans));
      int score = quizBrain.getScore();
      int qnum = quizBrain.numberOfQuestions();
      if (quizBrain.isFinished()) {
        Alert(
                context: context,
                title: 'You have finished the quiz!',
                desc: 'You got $score/$qnum ')
            .show();
        quizBrain.reset();
        scoreKeeper.clear();
      } else {
        quizBrain.nextQuestion();
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                child: Text('True', style: TextStyle(color: Colors.white, fontSize: 20),),
                color: Colors.green,
                onPressed: (){
                  check(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                child: Text('False', style: TextStyle(color: Colors.white, fontSize: 20),),
                color: Colors.red,
                onPressed: (){
                  check(false);
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
