import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Quiz',
        style: TextStyle(color: Colors.black54),
      ),
      Text(
        'Heap',
        style: TextStyle(color: Colors.blue),
      ),
    ],
  );
}
