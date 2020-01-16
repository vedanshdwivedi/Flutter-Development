import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// https://jsonplaceholder.typicode.com/posts

void main() async {
  List _data = await getJSON();
  runApp(new MaterialApp(
    title: 'JSON Object Parser',
    home: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("JSON Object Parsing"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(4.4),
        itemBuilder: (BuildContext context, int position) {
          return Column(
            children: <Widget>[
              Divider(
                height: 3.4,
              ),
              ListTile(
                title: Text(
                  _data[position]["title"],
                  style: new TextStyle(
                    fontSize: 17.2,
                    fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Text(_data[position]["body"]),
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(_data[position]["id"].toString()),
                ),
                onTap: () => showTapMessage(context, position, _data[position]["title"]),
                // onTap: showTapMessage(context, position)
                
              )
            ],
          );
        },
        itemCount: _data.length,
      ),
    ),
  ));
}


void showTapMessage(BuildContext context, int position, String showcase){
  var alertDialog = new AlertDialog(
    title: Text(""),
    actions: <Widget>[
      FlatButton(
        onPressed: () => debugPrint("OK Pressed"),
        child: Text(showcase),
      )
    ],
  );

  showDialog(context: context, builder: (context){
    return alertDialog;
  });
}



Future<List> getJSON() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
