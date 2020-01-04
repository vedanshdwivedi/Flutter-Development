import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _money=0;
  Color x = Colors.greenAccent;
  String tell = "Let the money rain over you.";

  void _rainMoney(){
    //Important - setState() is called each time we need to update UI
    setState(() {
      _money = _money + 100;
      if(_money > 10000){
        x = Colors.deepOrange;
        tell = "Stop it Dude, You are Rich Now.";
      }
      if(_money > 1000){
        x = Colors.green[800];
        tell = "Slow down now...";
      }
    });
  }
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
                child: new Text(tell, style: new TextStyle(
                  color: x,
                  fontSize: 20,
                ),),
              )
            ),

            new Expanded(
              child: new Center(
                child: new Text('\$ $_money', style: new TextStyle(
                  color: x,
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
                  onPressed: _rainMoney,
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
