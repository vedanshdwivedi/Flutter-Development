import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/rendering.dart';

import './home.dart';

String adminName = "";

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(adminName.isEmpty || adminName==""){
      var router = new MaterialPageRoute(builder: (BuildContext context){
        return Home();
      });
      Navigator.of(context).push(router);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cucek Attendance Manager"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new ListView(
        children: <Widget>[
          Text("Welcome $adminName"),
        ],
      ),
    );
  }
}