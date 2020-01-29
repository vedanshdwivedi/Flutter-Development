import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './util/utils.dart' as util;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void showStuff() async{
    Map data = await getWeather(util.appId, util.defaultCity);
    debugPrint(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Klimatic Weather"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.menu),
            onPressed: showStuff,
          ),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/umbrella.png',
                width: 500.0, height: 1200.0, fit: BoxFit.fill),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
            alignment: Alignment.topRight,
            child: new Text("Jamshedpur", style: cityStyle()),
          ),

          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/rain.png'),
          ),

          // Container that has weather Data
          new Container(
            alignment: Alignment.center,
            margin: new EdgeInsets.fromLTRB(60, 420, 150, 0),
            child: updateTempWidget(util.defaultCity),
          ),
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city) async {
    // units = imperial for Fahrenheit and metric for Celcius
    
    String apiUrl =
        "https://samples.openweathermap.org/data/2.5/find?q=$city&units=metric&appid=${util.appId}";
    //debugPrint(apiUrl);
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }


  Widget updateTempWidget(String city){
    return new FutureBuilder(
      future: getWeather(util.appId, city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
          Map content = snapshot.data;
          List contentList = content["list"];
          return new Container(
            child: new Column(
              children: <Widget>[
                new ListTile(
                  
                  title: new Text(contentList[0]["main"]["temp"].toString(), style: weatherStyle(),),
                ),
              ],
            ),
          );
        }else{
          return new Container();
        }
    });
  }
}

TextStyle cityStyle() {
  return new TextStyle(
      color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30.0);
}

TextStyle weatherStyle() {
  return new TextStyle(
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontSize: 50.0,
      fontWeight: FontWeight.w500);
}
