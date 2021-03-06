import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './home.dart';

String teacherName = "";

class Teacher extends StatefulWidget {
  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  void initState() {
    // TODO: implement initState
    super.initState();
    if (teacherName.isEmpty || teacherName == "") {
      var router = new MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
      Navigator.of(context).push(router);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Cucek Attendance Manager"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new ListView(
        children: <Widget>[
          Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome $teacherName",
                  style: new TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),


        ],
      ),
    );
  }
}
