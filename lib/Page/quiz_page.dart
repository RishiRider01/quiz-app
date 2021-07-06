import 'package:quiz_app/Widget/app_name.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_questions.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  QuestionBank questions = QuestionBank();

  void checkAnswer(answer) {
    bool correctAnswer = questions.getAnswer();
    setState(
      () {
        if (correctAnswer == answer) {
          if (scoreKeeper.length < questions.getLength())
            scoreKeeper.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        questions.nextQuestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appName(),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            //questions
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: Text(
                  questions.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton(
                    color: Colors.green,
                    child: Text(
                      'true',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                    }),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    'false',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
