import 'package:firebase_database/firebase_database.dart';

class Teacher{
  String name;
  String id;
  String dept;
  String password;

  Teacher(this.name, this.dept, this.password);

  Teacher.fromSnapshot(DataSnapshot snapshot) : 
    id = snapshot.id,
    name = snapshot.value["name"],
    password = snapshot.value["password"],
    dept = snapshot.value["dept"];


  toJson(){
    return {
      "name": name,
      "password": password,
      "dept": dept,
    };
  }
}