import 'package:firebase_database/firebase_database.dart';

class Teacher{
  String name;
  String email;
  String id;
  String dept;
  String password;

  Teacher(this.name, this.dept, this.email, this.password);
  

  Teacher.fromSnapshot(DataSnapshot snapshot) : 
    id = snapshot.key,
    name = snapshot.value["name"],
    email = snapshot.value["email"],
    password = snapshot.value["password"],
    dept = snapshot.value["dept"];


  toJson(){
    return {
      "name": name,
      "email": email,
      "password": password,
      "dept": dept,
    };
  }
}