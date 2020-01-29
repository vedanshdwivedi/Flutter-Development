import 'package:flutter/material.dart';
import '../home.dart';
import '../util/utils.dart' as utils;

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  var _getInputCity = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Select City"),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: new Stack(
          children: <Widget>[
            new Center(
              child: new Image.asset('images/snow.png',
                  width: 500.0, height: 1200.0, fit: BoxFit.fill),
            ),
            new ListView(
              children: <Widget>[
                new ListTile(
                  title: new TextField(
                    controller: _getInputCity,
                    decoration: new InputDecoration(
                      labelText: "Enter City Name",
                    ),
                  ),
                ),
                new ListTile(
                  title: new RaisedButton(
                    child: new Text("Set City"),
                    onPressed: () {
                      var router = new MaterialPageRoute(
                          builder: (BuildContext context) {
                        utils.defaultCity = _getInputCity.text;

                        return new Home();
                      });
                      Navigator.of(context).push(router);
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
