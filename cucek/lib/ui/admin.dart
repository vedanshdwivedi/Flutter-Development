import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/rendering.dart';

import './home.dart';
import './previous_record.dart';
import './change_admin_password.dart';
import './update_teacher.dart';
import './update_student.dart';

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
        title: new Text("ADMIN"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.highlight_off, color: Colors.white,),
            onPressed: _logout,
          ),
        ],
      ),


      body: new ListView(
        children: <Widget>[
          Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome $adminName",
                  style: new TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          // add/ remove teacher
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new RaisedButton(
              color: Colors.orangeAccent,
              child: Text("Add / Remove Teacher"),
              onPressed: _updateTeacher,
            ),
          ),


          // add/remove student
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new RaisedButton(
              color: Colors.orangeAccent,
              child: Text("Add/ Remove Student"),
              onPressed: _updateStudent,
            ),
          ),


          // attendance record
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new RaisedButton(
              color: Colors.orangeAccent,
              child: Text("View Previous Records"),
              onPressed: (){
                var router= new MaterialPageRoute(builder: (BuildContext context){
                  return PreviousRecord();
                });
              },
            ),
          ),


          // change password
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new RaisedButton(
              color: Colors.orangeAccent,
              child: Text("Change Admin Password"),
              onPressed: (){
                var router= new MaterialPageRoute(builder: (BuildContext context){
                  return AdminPassword();
                });
                Navigator.of(context).push(router);
              },
            ),
          ),



        ],
      ),
    );
  }
  _updateTeacher(){
    // handle the updates of teachers
  }

  _updateStudent(){
    // handle the updates of students
  }

  _logout(){

  }
}