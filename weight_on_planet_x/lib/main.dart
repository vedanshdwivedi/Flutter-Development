import 'package:flutter/material.dart';
import './planet.dart';

void main() {
  runApp(Weight());
}

class Weight extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weight on Planet X",
      home: new Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: Text("Weight on Planet X !!!"),
          centerTitle: true,
          backgroundColor: Colors.green[400],
        ),
        body: Planet(),
      ),
    );
  }
}