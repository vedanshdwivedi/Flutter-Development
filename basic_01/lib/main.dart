import 'package:flutter/material.dart';

/*
void main() {
  runApp(MyApp());
}

*/

// short-hand for above commented code
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // @decorators

  @override
  Widget build(BuildContext context) {
    // Scaffold creats a base page design
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Vedansh First App'),
      ),
      body: Text("I am currently learning"),
    ));
  }
}
