
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/Admin.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final FirebaseDatabase database = FirebaseDatabase.instance;
DatabaseReference databaseReference = database.reference().child("admin");

// create
// run only once

  addAdmin(){
    Admin admin = new Admin("vedansh", "admin");
    databaseReference.push().set(admin.toJson());
  }

addTeacher(String name, String dept, String password){
  database.reference().child("teacher").set({
    "name": name,
    "dept": dept,
    "password": password
  });
}

addStudent(String id, String name, String dept, String password){
  database.reference().child("student").set({
    "name": name,
    "id": id,
    "dept": dept,
    "password": password
  });
}

