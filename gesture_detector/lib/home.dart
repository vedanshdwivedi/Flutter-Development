import 'package:flutter/material.dart';
import './custombutton.dart';

class Home extends StatelessWidget{

  final String title;

  Home(this.title);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange.shade400,
        title: Text(title),
      ),

      body: new Center(
        child: new customButton(),
      ),
    );
  }
}
