import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  _onPress() {
    print("Search Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: new Text("Scaffold App Bar"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.send),
            onPressed: () => debugPrint('Send Tapped'),
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: _onPress,
          ),
        ],
      ),

      // Other Properties
      backgroundColor: Colors.grey[300],
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Hello Vedansh",
                style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.deepOrange,
                    fontSize: 14.5)),

            new InkWell(
              child: new Text("Tap Me"),
              onTap: () => debugPrint('Inkwell Tapped'),
            ),
          ],
        ),
      ),
    );
  }
}
