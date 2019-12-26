import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // @decorators

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      if (questionIndex == 0) {
        questionIndex = 1;
      } else {
        questionIndex = 0;
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
          Text(questions[questionIndex]),
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
