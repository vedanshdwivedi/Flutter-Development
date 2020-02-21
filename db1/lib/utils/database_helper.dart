import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

import '../models/users.dart';

class DatabaseHelper{
  final String tableUser = "UserTable";
  final String columnId = "id";
  final String columnUsername = "username";
  final String columnPassword = "password";

  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database _db;



  Future<Database> get db async{
    if(_db!=null)
      return _db;
    _db = await initDb();
    return _db;
  }


  DatabaseHelper.internal();



  initDb() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "maindb.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }




  void _onCreate(Database db, int newVersion) async{
    await db.execute(
      "CREATE TABLE $tableUser ($columnId INTEGER PRIMARY KEY, $columnUsername TEXT, $columnPassword TEXT)"
    );
  }


  // Insert Data
  Future<int> saveUser(User user) async{
    var dbClient = await db;
    int res = await dbClient.insert(tableUser, user.toMap());
    return res;
  }

  // Get Users : READ
  Future<List> getAllUsers() async{
    var dbClient = await db;
    var result = await dbClient.rawQuery(
      "SELECT * FROM $tableUser"
    );
    return result.toList();
  }

  Future<int> getCount() async{
    var dbClient = await db;
    return Sqflite.firstIntValue(
      await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableUser"
      ));
  }

  Future<User> getUser(int id) async{
    var dbClient = await db;

    var result = await dbClient.rawQuery(
      "SELECT * FROM $tableUser WHERE $columnId=$id"
    );
    if(result.length == 0)
      return null;
    else 
      return new User.fromMap(result.first);
  }

  // DELETE USER
  Future<int> removeUser(int id) async{
    var dbCLient = await db;
    return await dbCLient.delete(tableUser, where: "$columnId = ?", whereArgs: [id]);
  }

  // Update User
  Future<int> updateUser(User user) async{
    var dbCLient = await db;
    return await dbCLient.update(tableUser, user.toMap() ,where: "$columnId = ?", whereArgs: [user.id]);
  }


  Future close() async{
    var dbClient = await db;
    return dbClient.close();
  }

}