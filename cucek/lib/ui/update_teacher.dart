// TODO Implement this library.
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'admin.dart';
import '../models/Teacher.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final GlobalKey<FormState> delForm = GlobalKey<FormState>();
DatabaseReference databaseReference;
final FirebaseAuth _auth = FirebaseAuth.instance;

class updateTeacher extends StatefulWidget {
  @override
  _updateTeacherState createState() => _updateTeacherState();
}

class _updateTeacherState extends State<updateTeacher> {
  String _dept;
  String _name;
  String _password;
  String _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseReference = database.reference().child("teacher");
    String _dept = "";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Add Teacher"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new ListView(
        children: <Widget>[
          // Form to add student
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // get teacher department
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
                          return "Please select a role";
                        } else {
                          _dept = value;
                          return null;
                        }
                      },
                    ),
                  ),
                ),

                // get teacher name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Name", icon: Icon(Icons.person)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please Enter ID";
                      }
                      _name = value;
                      return null;
                    },
                  ),
                ),

                // Get teacher email
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

                // get teacher password
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
                      child: Text("Create Faculty"),
                    ),
                  ),
                )
              ],
            ),
          ),

          // form to delete student
          // Form(
          //     key: delForm,
          //     child: new Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Card(
          //           color: Colors.redAccent,
          //           child: Container(
          //             child: ListView(
          //               children: <Widget>[
          //                 // get email
          //                 Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: TextFormField(
          //                     decoration: InputDecoration(
          //                         labelText: "Enter email to delete",
          //                         icon: Icon(Icons.mail_outline)),
          //                     validator: (value) {
          //                       if (value.isEmpty) {
          //                         return "Enter email";
          //                       }
          //                       _email = value;
          //                       return null;
          //                     },
          //                   ),
          //                 ),

          //                 // Remove Button
          //                 RaisedButton(
          //                   onPressed: () {
          //                     //databaseReference.onChildChanged.listen(_handleDelete);
          //                     _handleDelete();
          //                   },
          //                   child: Text("Remove"),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     )),
        ],
      ),
    );
  }

  _handleSubmit() async {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      Teacher tcr = new Teacher(_name, _dept, _email, _password);
      form.reset();
      databaseReference.push().set(tcr.toJson());
      FirebaseUser user = await _auth
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((userNew) {});
    }
    var route = new MaterialPageRoute(builder: (BuildContext context) {
      return Admin();
    });
    Navigator.of(context).push(route);
  }

  _handleDelete() async {
    final FormState form = delForm.currentState;
    if (form.validate()) {
      form.save();
      form.reset();
      Teacher tcr;
      Query query = await databaseReference
          .child("email")
          .equalTo(_email)
          .once()
          .then((DataSnapshot snapshot) {
        tcr = Teacher.fromSnapshot(snapshot);
      });
      deleteTeacher(tcr.id);
    }
    var route = new MaterialPageRoute(builder: (BuildContext context) {
      return Admin();
    });
    Navigator.of(context).push(route);
  }

  deleteTeacher(key) {
    databaseReference.child(key).remove().then((_) {});
  }
}
