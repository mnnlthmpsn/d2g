/*
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:Duty2Go/vehicle_details.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Database _db;

  static const String ID = 'id';
  static const String DATE = 'date';
  static const String VIN = 'vin';
  static const String MAKE = 'make';
  static const String MODEL = 'model';
  static const String TRIM = 'trim';
  static const String YEAR = 'year';
  static const String BODY = 'bodyType';
  static const String DRIVE = 'driveType';
  static const String COUNTRY = 'countryOfManufacture';
  static const String PLANT = 'plant';
  static const String MSRP = 'msrp';
  static const String CYLINDERS = 'cylinders';
  static const String CC = 'displacement';
  static const String FUEL = 'fuelType';
  static const String ASPIRATION = 'aspiration';
  static const String TRANSMISSION = 'transmission';

  static const String TABLE = 'History';
  static const String DB_NAME = 'duty2go.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $DATE TEXT, $VIN TEXT, $MAKE TEXT, $MODEL TEXT, $TRIM TEXT, $YEAR TEXT, $BODY TEXT, $DRIVE TEXT, $COUNTRY TEXT, $PLANT TEXT, $MSRP TEXT, $CYLINDERS TEXT, $CC TEXT, $FUEL TEXT, $ASPIRATION TEXT, $TRANSMISSION TEXT  )");
  }

  Future<vehicleValue> save(vehicleValue vehicle_details) async {
    var dbClient = await db;
    vehicle_details.id = await dbClient.insert(TABLE, vehicle_details.toJson());
    return vehicle_details;
  }

  Future <List<vehicleValue>> getVehicle() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [
      DATE,
      VIN,
      MAKE,
      MODEL,
      TRIM,
      YEAR,
      BODY,
      DRIVE,
      COUNTRY,
      PLANT,
      MSRP,
      CYLINDERS,
      CC,
      FUEL,
      ASPIRATION,
      TRANSMISSION
    ]);
    List<vehicleValue> vehicles = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        vehicles.add(vehicleValue.fromJson(maps[i]));
      }
    }
    return vehicles;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}

*/
