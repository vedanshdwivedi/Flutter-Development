import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Item 1 ", style: new TextStyle(color: Colors.white, fontSize: 18, ),),
          new Container(
            color: Colors.deepOrange,
            child: new Text("Item 3", style: new TextStyle(color: Colors.black, fontSize: 18),),
          )
        ],
      ),
      
      
      
      
      
      
      /*
        child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Item 1", style: new TextStyle(color: Colors.white),),
          new Text("Item 2", style: new TextStyle(color: Colors.blue),),
          new Container(
            color: Colors.deepOrange,
            alignment: Alignment.bottomRight,
            child: new Text("Item 3", style: new TextStyle(color: Colors.black),),
          ),
        ],
      ),*/



      /*child: Text(
        "Hello Container",
        textDirection: TextDirection.ltr,
        style: new TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18.2),
      ), */
      alignment: Alignment.center,
    );
  }
}