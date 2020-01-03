import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackbar = new SnackBar(
          content: new Text("Hello Gestures"),
          backgroundColor: Theme.of(context).backgroundColor,
          duration: new Duration(
              hours: 0,
              minutes: 0,
              seconds: 0,
              milliseconds: 1000,
              microseconds: 0),
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },

      // The Actual Button
      child: new Container(
        padding: new EdgeInsets.all(18.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(5.5),
        ),
        child: new Text('First Button'),
      ),
    );
  }
}
