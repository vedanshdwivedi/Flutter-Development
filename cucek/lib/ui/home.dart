// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

import './teacher.dart';
import './admin.dart';
import '../utils/database_utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedRole = "";

  @override
  void initState() {
    super.initState();
    _selectedRole = "";
  }

  final _formKey = GlobalKey<FormState>();
  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cucek Attendance Manager"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: new Center(
          child: new ListView(
            children: <Widget>[
              Image.asset("images/cusat_logo.png"),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DropDownFormField(
                      titleText: "SELECT ROLE",
                      hintText: "Please Select One",
                      value: _selectedRole,
                      onSaved: (value) {
                        setState(() {
                          _selectedRole = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value;
                        });
                      },
                      dataSource: [
                        {"display": "Admin", "value": "admin"},
                        {"display": "Teacher", "value": "teacher"},
                        {"display": "Student", "value": "student"},
                      ],
                      textField: 'display',
                      valueField: 'value',
                      validator: (value) {
                        if (value == "") {
                          return "Please select a role";
                        } else {
                          _selectedRole = value;
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "ID",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter ID";
                        }
                        _username = value;
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please Enter Password";
                        }
                        _password = val;
                        return null;
                      },
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: RaisedButton(
                        onPressed: _loginRole,
                        child: Text("Login"),
                        color: Colors.redAccent,
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginRole() {
    print("Attempt Login");
    // Perform Login
    if (_formKey.currentState.validate()) {
      print("User : $_username and Role : $_selectedRole");
      var router = new MaterialPageRoute(builder: (BuildContext context) {
        // build a bridge between pages
        if (_selectedRole == 'teacher') {
          teacherName = _username;
          return Teacher();
        } else {
          adminName = _username;
          return new Admin();
        }
      });
      // use the bridge to move
      Navigator.of(context).push(router);
    }
  }
}
