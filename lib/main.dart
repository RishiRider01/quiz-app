import 'package:flutter/material.dart';
import 'Page/quiz_page.dart';

void main() {
  runApp(QuizHeap());
}

class QuizHeap extends StatelessWidget {
  // This widget is the root of your application.
  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}
