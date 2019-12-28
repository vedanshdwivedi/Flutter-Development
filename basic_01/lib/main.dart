import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
      if (_questionIndex == 2) {
        _questionIndex = 0;
      } else {
        _questionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "What's your favorite color ?",
        'answers': ['Red', 'Black', 'Green', 'White'],
      },
      {
        'questionText': "What's your favorite animal ?",
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': "Who's your favorite instructor ?",
        'answers': ['Vedansh', 'Ved', 'Dwivedi', 'Vedansh Dwivedi'],
      },
    ];
    // Scaffold creats a base page design
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Vedansh First App'),
      ),
      body: Column(
        children: <Widget>[
          Question(questions[_questionIndex]['questionText']),
          ...(questions[_questionIndex]['answers'] as List<String>).map((answer){
            return Answer(answerQuestion, answer);
          }).toList()
        ],
      ),
    ));
  }
}
