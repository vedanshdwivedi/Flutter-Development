import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String _answerText;
  final Function selectHadndler;

  Answer(this.selectHadndler, this._answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blueGrey,
        textColor: Colors.white,
        onPressed: selectHadndler,
        child: Text(_answerText),
    ));
  }
}
