import 'package:firebase_database/firebase_database.dart';

class Student{
  String name;
  String id;
  String email;
  String year;
  String dept;
  String password;

  Student(this.name, this.dept, this.year, this.email, this.password);

  Student.fromSnapshot(DataSnapshot snapshot) : 
    id = snapshot.key,
    name = snapshot.value["name"],
    email = snapshot.value["email"],
    year = snapshot.value["year"],
    password = snapshot.value["password"],
    dept = snapshot.value["dept"];


  toJson(){
    return {
      "name": name,
      "password": password,
      "dept": dept,
      "year": year,
    };
  }
}