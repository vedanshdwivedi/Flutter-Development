import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'Screens',
    home: new Home(),
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Screen A"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _nameFieldController,
              decoration: new InputDecoration(
                labelText: 'Enter your name',
              ),
            ),
          ),

          new ListTile(
            title: new RaisedButton(
              onPressed: (){
                var router = new MaterialPageRoute(builder: (BuildContext context){
                  // build a bridge between pages
                  return new NextScreen(name: _nameFieldController.text,);
                });

                // use the bridge to move
                Navigator.of(context).push(router);
              },
              child: new Text("Go to next Screen"),
            ),
          ),
        ],
      )
    );
  }
}


class NextScreen extends StatefulWidget {
  final String name;

  NextScreen({Key key, this.name}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Screen B"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text('${widget.name}'),
          )
        ],
      ),
    );
  }
}