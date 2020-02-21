import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import './utils/database_helper.dart';
import './models/users.dart';



List _users;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //var db = new DatabaseHelper();
  // Add User
  // int savedUser = await db.saveUser(new User("Vedansh", "Dwivedi"));
  // print("User Saved $savedUser");

  // Get All Users
  /*
  int res = await db.removeUser(2);
  int userCount = await db.getCount();
  _users = await db.getAllUsers();
  print("No of users : $userCount");
  for (int i=0; i< _users.length; i++){
    User user = User.map(_users[i]);
    print("Username: ${user.username}        Id : ${user.id}");
  }

  */

  
    var db = new DatabaseHelper();
    int userCount = await db.getCount();
    _users = await db.getAllUsers();

  runApp(new MaterialApp(
    title: 'Databases 1',
    home: new Home(),
  ));
}

class Home extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Databases"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: new ListView.builder(
        itemCount: _users.length,
        padding: const EdgeInsets.all(5.6),
        itemBuilder: (_, int position){
          User user = User.map(_users[position]);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(
                height: 5,
              ),
              new ListTile(
                title: new Text("${user.username}", style: new TextStyle(
                    color: Colors.orange,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                  ),),
                subtitle: new Text("${user.password}", style: new TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.5
                ),),
                leading: new CircleAvatar(
                  child: new Text("${user.id}"),
                  backgroundColor: Colors.redAccent,
                ),
              )
            ],
          );
        },
        )
    );
  }
}
