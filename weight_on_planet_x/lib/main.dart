import 'package:flutter/material.dart';
import './weight.dart';

void main() {
  runApp(Planet());
}

class Planet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight on Planet X',
      home: new Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: new AppBar(
          backgroundColor: Colors.black38,
          title: Text('Weight on Planet X'),
          centerTitle: true,
        ),
        body: new Weight(),
      ),
    );
  }
}
