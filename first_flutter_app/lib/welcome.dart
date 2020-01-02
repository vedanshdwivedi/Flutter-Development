import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue,
      child: Center(
        child: Text(
        "Hello, this is Vedansh",
        textDirection: TextDirection.ltr,
        style: new TextStyle(
            fontWeight: FontWeight.w800, 
            fontStyle: FontStyle.italic,
            fontSize: 32,
        ),
      ),
      ),
    );
  }
}
