// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/rendering.dart';

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
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network("https://www.noticebard.com/wp-content/uploads/2019/04/CUSAT.png"),
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
                        }
                        return null;
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
                        return null;
                      },
                    ),

                    Center(child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: RaisedButton(onPressed: () => _loginRole, child: Text("Login"), color: Colors.redAccent,),
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
  _loginRole(){
    // Perform Login 
  }
}
