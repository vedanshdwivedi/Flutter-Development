import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.deepOrange[100],
        appBar: new AppBar(
          title: Text('Let it Rain!'),
          backgroundColor: Colors.deepOrange[400],
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Let it Rain',
                style: new TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
              new Text(
                '\$ 10000',
                style:
                    new TextStyle(fontSize: 36, color: Colors.green.shade800),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
              new IconButton(
                icon: new Icon(Icons.attach_money),
                onPressed: () => debugPrint('Add Money Please'),
              )
            ],
          ),
        ),
        );
  }
}
