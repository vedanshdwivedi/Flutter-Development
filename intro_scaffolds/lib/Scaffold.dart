import 'package:flutter/material.dart';

class Home extends StatelessWidget{

   _onPress(){
    print("Search Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: new Text("Scaffold App Bar"),

        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.send), onPressed: () => debugPrint('Send Tapped'),),
          new IconButton(icon: new Icon(Icons.search), onPressed: _onPress,),
        ],
      ),
    );
  }
}