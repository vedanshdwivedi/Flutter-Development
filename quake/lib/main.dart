import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

void main() async {
  Map _features = await getJSON();
  //calcDate("1578886234710");
  List _data = _features["features"];
  runApp(new MaterialApp(
    title: 'Earthquake App',
    home: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text("Quake"),
        centerTitle: true,
      ),
      body: new ListView.builder(
        padding: const EdgeInsets.all(5.6),
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int position) {
          return Column(
            children: <Widget>[
              Divider(
                height: 5,
              ),
              ListTile(
                title: new Text(
                  "${calcDate(_data[position]["properties"]["time"] * 1000)}",
                  style: new TextStyle(
                    color: Colors.orange,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                contentPadding: new EdgeInsets.all(4.0),
                subtitle: new Text(
                  _data[position]["properties"]["place"],
                  style: new TextStyle(fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.5
                  ),
                ),
                leading: new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                      _data[position]["properties"]["mag"].toStringAsFixed(1)),
                ),
                onTap: () => showTapMessage(
                    context, position, _data[position]["properties"]["title"]),
              )
            ],
          );
        },
      ),
    ),
  ));
}

String calcDate(int d) {
  DateTime date = new DateTime.fromMicrosecondsSinceEpoch(d, isUtc: true);
  var format = new DateFormat.yMMMMd("en_US").add_jm();
  return format.format(date);
}

void showTapMessage(BuildContext context, int position, String placeText) {
  var alertDialog = new AlertDialog(
    title: Text("Quake"),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          placeText,
        ),
      ),
      FlatButton(
        onPressed: () => Navigator.pop(context),
        child: Text("Okay"),
      )
    ],
  );

  showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      });
}

Future<Map> getJSON() async {
  String apiURL =
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response response = await http.get(apiURL);
  return json.decode(response.body);
}
