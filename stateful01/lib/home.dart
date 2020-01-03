import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Make it Rain!'),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(
                'Get Rich!',
                style: new TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 30),
              ),
            ),

            new Expanded(
              child: new Center(
                child: new Text('Money', style: new TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.w800,
                  fontSize: 47,
                ),),
              ),
            ),


            new Expanded(
              child: new Center(
                child: new FlatButton(
                  color: Colors.lightGreen,
                  textColor: Colors.white70,
                  onPressed: () => debugPrint('Hey'),
                  child: Text("Let it Rain", style: new TextStyle(
                    fontSize: 20
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
