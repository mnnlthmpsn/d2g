
import 'package:Duty2Go/vehicle.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import 'dart:async';


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

  Future<dynamic> getVin() async {
    final db = await database;
    var res = await db.query("history");
    if(res.length == 0){
      return null;
    }else {
      var resMap = res;
      return resMap.isNotEmpty ? resMap : Null;
    }
  }
}

