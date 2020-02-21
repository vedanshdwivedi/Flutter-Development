import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

import '../model/nodo_item.dart';

class DatabaseHelper{
  final String tableUser = "NoToDoTable";
  final String columnId = "id";
  final String columnItemName = "itemName";
  final String columnDateCreated = "dateCreated";

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
    String path = join(documentDirectory.path, "notodo_db.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }


  void _onCreate(Database db, int newVersion) async{
    await db.execute(
      "CREATE TABLE $tableUser ($columnId INTEGER PRIMARY KEY, $columnItemName TEXT, $columnDateCreated TEXT)"
    );
  }


  // Insert Data
  Future<int> saveItem(NoDoItem item) async{
    var dbClient = await db;
    int res = await dbClient.insert(tableUser, item.toMap());
    return res;
  }

  // Get Users : READ
  Future<List> getAllItems() async{
    var dbClient = await db;
    var result = await dbClient.rawQuery(
      "SELECT * FROM $tableUser ORDER BY $columnDateCreated DESC"
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

  Future<NoDoItem> getItem(int id) async{
    var dbClient = await db;

    var result = await dbClient.rawQuery(
      "SELECT * FROM $tableUser WHERE $columnId=$id"
    );
    if(result.length == 0)
      return null;
    else 
      return new NoDoItem.fromMap(result.first);
  }

  // DELETE USER
  Future<int> removeItem(int id) async{
    var dbCLient = await db;
    return await dbCLient.delete(tableUser, where: "$columnId = ?", whereArgs: [id]);
  }

  // Update User
  Future<int> updateItem(NoDoItem item) async{
    var dbCLient = await db;
    return await dbCLient.update(tableUser, item.toMap() ,where: "$columnId = ?", whereArgs: [item.id]);
  }


  Future close() async{
    var dbClient = await db;
    return dbClient.close();
  }

}