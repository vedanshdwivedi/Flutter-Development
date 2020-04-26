import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_network/pages/home.dart';

import '../widgets/header.dart';
import '../widgets/progress.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _textController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String username;
  bool ifExist = false;
  final _formKey = GlobalKey<FormState>();

  submit(){
    final form = _formKey.currentState;
    ifExist = false;
    if(form.validate()){
      form.save();
      SnackBar snackbar = SnackBar(content: Text("Welcome $username")); 
      _scaffoldKey.currentState.showSnackBar(snackbar);
      Timer(Duration(seconds: 2), (){
        circularProgress();
        Navigator.pop(context, username);
      });
      
    }
    
  }

  bool checkUniqueUsername(val) {
    usersRef.where("username", isEqualTo: val).getDocuments().then((QuerySnapshot snapshot){
      snapshot.documents.forEach((DocumentSnapshot doc){

        ifExist = true;
        print(ifExist);
        _textController.clear();
        // CreateAccount();
        return doc.exists;
      });
    });
    print("Doc doesn't exists, proceed : $val $ifExist");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: header(context, titleText: "Set up your Profile", removeBackButton: true),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: Text(
                      "Create a Username",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _textController,
                        autovalidate: true,
                        validator: (val){
                          // ifExist = false;
                          if(!checkUniqueUsername(val)){
                            return "Username already exists";
                          }
                          if(val.trim().length < 3 || val.isEmpty){
                            return ifExist ? "Username already exists" : "Username too short";
                          }else if(val.trim().length > 15){
                            return "Username too long";
                          }else{
                            return null;
                          }
                        },
                        onSaved: (val){
                          username = val;
                          ifExist = false;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "username",
                          labelStyle: TextStyle(fontSize: 15.0),
                          hintText: "Must be ateast 3 characters",
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: submit,
                  child: Container(
                    height: 50.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Submit", style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
