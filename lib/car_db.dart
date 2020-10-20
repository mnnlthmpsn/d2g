import 'dart:async';
import 'car.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'user.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();


  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE history (
        date TEXT, vin TEXT PRIMARY KEY, make TEXT, model TEXT, trim TEXT, year TEXT, body_type TEXT, drive_type TEXT, country_of_manufacture TEXT, plant TEXT, msrp TEXT, cylinders TEXT, displacement TEXT, fuel_type TEXT, aspiration TEXT, transmission TEXT
        )
        ''');

      await db.execute('''
        CREATE TABLE login (
        EMAIL TEXT, URL TEXT, STATE TEXT
        )
        ''');
    });
  }


  newCar(Car newCar) async {
    final db = await database;
    var res = await db.insert("history", newCar.toMap());
    return res;
  }

  getCar(String vin) async {
    final db = await database;
    var res =await  db.query("history", where: "VIN = ?", whereArgs: [vin]);

    print(res.length);
    if(res.length == 0){
      return null;
    }else {
      var res1 = res[0];
      print('--------------------fffff----------------------');
      print(res1);
      return res1;
    }

  }

/*  Future<List<Map<String, dynamic>>> getAllCars() async {
  }*/

  Future<List<Map<String, dynamic>>> getAllCars() async {
    final db = await database;
    var res = await db.query('history', columns: ['vin']);
    print('------------------------------------------');
    print(res.length);
    if(res.length == 0){
      return null;
    }else {
      var resMap = res.toList();
      print('------------------------------------------');
      print(resMap);
      return resMap;
    }

  }

  deleteCar(String vin) async {
    final db = await database;
    db.delete("history", where: "VIN = ?", whereArgs: [vin]);
  }

  updateUser(User updateUser) async {
    final db = await database;

    await db.execute("DROP TABLE IF EXISTS login");
    await db.execute("CREATE TABLE login (EMAIL TEXT, URL TEXT, STATE TEXT)");

    var res = await db.rawInsert('''
    INSERT INTO login(
    EMAIL, URL, STATE
    ) VALUES (?, ?, ?)
    ''', [updateUser.email, updateUser.url, updateUser.state]);

    return;
  }

  getUser() async {
    var _value;
    final db = await database;

    var res1 = await db.query("login");

    if (res1.length == 0) {
      _value = res1.length;
    } else {
      print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
      print(res1);
      String email = res1[0]['EMAIL'];
      String url = res1[0]["url"];
      String state = res1[0]["state"];

      _value = {'email': email, 'url': url, 'state': state};
    }
    return _value;
  }
}