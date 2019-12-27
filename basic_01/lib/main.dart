import 'package:flutter/material.dart';

import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // @decorators

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void answerQuestion() {
    setState(() {
      if (_questionIndex == 0) {
        _questionIndex = 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favorite color ?",
      "What's your favorite animal ?"
    ];
    // Scaffold creats a base page design
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Vedansh First App'),
      ),
      body: Column(
        children: <Widget>[
          Question(questions[_questionIndex]),
          RaisedButton(
            child: Text('Answer 1'),
            onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text('Answer 2'),
            onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text('Answer 3'),
            onPressed: answerQuestion,
          ),
        ],
      ),
    ));
  }
}
