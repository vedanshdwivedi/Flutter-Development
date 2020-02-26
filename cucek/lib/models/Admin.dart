import 'package:firebase_database/firebase_database.dart';

class Admin{
  String name;
  String id;
  String password;

  Admin(this.name, this.password);

  Admin.fromSnapshot(DataSnapshot snapshot) : 
    id = snapshot.id,
    name = snapshot.value["name"],
    password = snapshot.value["password"];

  toJson(){
    return {
      "name": name,
      "password": password,
    };
  }
}