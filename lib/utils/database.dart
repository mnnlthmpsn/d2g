/*

import 'dart:async';
import 'dart:convert';

import 'package:Duty2Go/user.dart';
import 'package:Duty2Go/vehicle.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';


class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'test.db'),
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE history (
        DATE TEXT, VIN TEXT PRIMARY KEY, MAKE TEXT, MODEL TEXT, TRIM TEXT, YEAR TEXT, BODY TEXT, DRIVE TEXT, COUNTRY TEXT, PLANT TEXT, MSRP TEXT, CYLINDERS TEXT, CC TEXT, FUEL TEXT, ASPIRATION TEXT, TRANSMISSION TEXT
        )
        ''');

        await db.execute('''
        CREATE TABLE login (
        EMAIL TEXT, URL TEXT, STATE TEXT
        )
        ''');
      },
      version: 1
    );
  }



  newVin(Vehicle newVin) async {
    final db = await database;

    var res = await db.rawInsert('''
    INSERT INTO history(
    DATE, VIN, MAKE, MODEL, TRIM, YEAR, BODY, DRIVE, COUNTRY, PLANT, MSRP, CYLINDERS, CC, FUEL, ASPIRATION, TRANSMISSION
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [newVin.date, newVin.vin, newVin.make, newVin.model, newVin.trim, newVin.year, newVin.bodyType, newVin.driveType, newVin.countryOfManufacture, newVin.plant, newVin.msrp, newVin.cylinders, newVin.displacement, newVin.fuelType, newVin.aspiration, newVin.transmission]);
    return res;
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


  Future <List<Map<String, dynamic>>> getVin() async {
    final db = await database;
    var res = await db.query("history");
    if(res.length == 0){
      return null;
    }else {
      var resMap = res;
      print('------------------------------------------');
      print(resMap);
      return resMap;
    }
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

class Car {
  String date;
  String vin;
  String model;
  Car({this.date, this.vin, this.model});
}
*/
/*
class Fuel {
  int id;
  String name;

  Fuel(this.id, this.name);

  static List<Fuel> getFuel() {
    return <Fuel>[
      Fuel(1, 'Apple'),
      Fuel(2, 'Google'),
      Fuel(3, 'Samsung'),
      Fuel(4, 'Sony'),
      Fuel(5, 'LG'),
    ];
  }
}

class Body {
  int id;
  String name;

  Body(this.id, this.name);

  static List<Body> getBody() {
    return <Body>[
      Body(1, 'Apple'),
      Body(2, 'Google'),
      Body(3, 'Samsung'),
      Body(4, 'Sony'),
      Body(5, 'LG'),
    ];
  }
}*//*



*/
