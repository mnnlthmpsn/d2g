import 'dart:convert';

Car clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Car.fromMap(jsonData);
}

String clientToJson(Car data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Car {
  String date;
  String vin;
  String make;
  String model;
  String trim;
  String year;
  String body_type;
  String drive_type;
  String country_of_manufacture;
  String plant;
  String msrp;
  String cylinders;
  String displacement;
  String fuel_type;
  String aspiration;
  String transmission;

  Car({this.date,
    this.vin,
    this.make,
    this.model,
    this.trim,
    this.year,
    this.body_type,
    this.drive_type,
    this.country_of_manufacture,
    this.plant,
    this.msrp,
    this.cylinders,
    this.displacement,
    this.fuel_type,
    this.aspiration,
    this.transmission});


  factory Car.fromMap(Map<String, dynamic> json) =>
      new Car(
        date: json['date'],
        vin: json['vin'],
        make: json['make'],
        model: json['model'],
        trim: json['trim'],
        year: json['year'],
        body_type: json['body_type'],
        drive_type: json['drive_type'],
        country_of_manufacture: json['country_of_manufacture'],
        plant: json['plant'],
        msrp: json['msrp'],
        cylinders: json['cylinders'],
        displacement: json['displacement'],
        fuel_type: json['fuel_type'],
        aspiration: json['aspiration'],
        transmission: json['transmission'],
      );

  Map<String, dynamic> toMap() => {
    'date': date,
    'vin':vin,
    'make': make,
    'model': model,
    'trim': trim,
    'year': year,
    'body_type': body_type,
    'drive_type': drive_type,
    'country_of_manufacture': country_of_manufacture,
    'plant': plant,
    'msrp': msrp,
    'cylinders': cylinders,
    'displacement': displacement,
    'fuel_type': fuel_type,
    'aspiration': aspiration,
    'transmission': transmission,
  };

}