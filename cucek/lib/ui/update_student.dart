// TODO Implement this library.
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './admin.dart';
import '../models/Student.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
DatabaseReference databaseReference;
final FirebaseAuth _auth = FirebaseAuth.instance;

class updateStudent extends StatefulWidget {
  @override
  _updateStudentState createState() => _updateStudentState();
}

class _updateStudentState extends State<updateStudent> {
  String _dept;
  String _year;
  String _name;
  String _password;
  String _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseReference = database.reference().child("student");
    _dept = "";
    _year = "";
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new ListView(
        children: <Widget>[
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // get student department
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: DropDownFormField(
                      titleText: "SELECT Department",
                      hintText: "Please Select One",
                      value: _dept,
                      onSaved: (value) {
                        setState(() {
                          _dept = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _dept = value;
                        });
                      },
                      dataSource: [
                        {"display": "CS", "value": "CS"},
                        {"display": "IT", "value": "IT"},
                        {"display": "EC", "value": "EC"},
                        {"display": "CE", "value": "CE"},
                        {"display": "ME", "value": "ME"},
                        {"display": "EE", "value": "EE"},
                        {"display": "MCA", "value": "MCA"},
                      ],
                      textField: 'display',
                      valueField: 'value',
                      validator: (value) {
                        if (value == "") {
                          return "Please select department";
                        } else {
                          _dept = value;
                          return null;
                        }
                      },
                    ),
                  ),
                ),

                // get year
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: DropDownFormField(
                      titleText: "SELECT Year",
                      hintText: "Please Select One",
                      value: _year,
                      onSaved: (value) {
                        setState(() {
                          _year = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _year = value;
                        });
                      },
                      dataSource: [
                        {"display": "1", "value": "Y1"},
                        {"display": "2", "value": "Y2"},
                        {"display": "3", "value": "Y3"},
                        {"display": "4", "value": "Y4"},
                      ],
                      textField: 'display',
                      valueField: 'value',
                      validator: (value) {
                        if (value == "") {
                          return "Please select year";
                        } else {
                          _year = value;
                          return null;
                        }
                      },
                    ),
                  ),
                ),

                // get student name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Name", icon: Icon(Icons.person)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please Enter Name";
                      }
                      _name = value;
                      return null;
                    },
                  ),
                ),

                // Get student email
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email", icon: Icon(Icons.mail_outline)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please Enter email";
                      }
                      _email = value;
                      return null;
                    },
                  ),
                ),

                // get student password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", icon: Icon(Icons.vpn_key)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password";
                      }
                      _password = value;
                      return null;
                    },
                  ),
                ),

                // Submit Button
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RaisedButton(
                      onPressed: _handleSubmit,
                      child: Text("Create Student"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _handleSubmit() async{
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      Student student = new Student(_name, _dept, _year,  _email ,_password);
      form.reset();
      databaseReference.child("$_year$_dept").push().set(student.toJson());
      FirebaseUser user = await _auth.createUserWithEmailAndPassword(email: _email, password: _password).then((userNew) {});
    }
    var route = new MaterialPageRoute(builder: (BuildContext context){
      return Admin();
    });
    Navigator.of(context).push(route);
  }
}
