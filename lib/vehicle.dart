import 'dart:convert';

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));
String vehicleToJson(Vehicle data) => json.encode(data.toJson());

class Vehicle {
  String date;
  String vin;
  String make;
  String model;
  String trim;
  String year;
  String bodyType;
  String driveType;
  String countryOfManufacture;
  String plant;
  String msrp;
  String cylinders;
  String displacement;
  String fuelType;
  String aspiration;
  String transmission;

  Vehicle(
      {this.date,
        this.vin,
        this.make,
        this.model,
        this.trim,
        this.year,
        this.bodyType,
        this.driveType,
        this.countryOfManufacture,
        this.plant,
        this.msrp,
        this.cylinders,
        this.displacement,
        this.fuelType,
        this.aspiration,
        this.transmission});

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    date: json['date'],
    vin: json['vin'],
    make: json['make'],
    model: json['model'],
    trim: json['trim'],
    year: json['year'],
    bodyType: json['body_type'],
    driveType: json['drive_type'],
    countryOfManufacture: json['country_of_manufacture'],
    plant: json['plant'],
    msrp: json['msrp'],
    cylinders: json['cylinders'],
    displacement: json['displacement'],
    fuelType: json['fuel_type'],
    aspiration: json['aspiration'],
    transmission: json['transmission'],
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'vin':vin,
    'make': make,
    'model': model,
    'trim': trim,
    'year': year,
    'body_type': bodyType,
    'drive_type': driveType,
    'country_of_manufacture': countryOfManufacture,
    'plant': plant,
    'msrp': msrp,
    'cylinders': cylinders,
    'displacement': displacement,
    'fuel_type': fuelType,
    'aspiration': aspiration,
    'transmission': transmission,
  };
}