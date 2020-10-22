import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'api.dart';
import 'custom_widget.dart';
import 'dutyCharges.dart';

class VinDetails extends StatefulWidget {
  final String temp;

  VinDetails(this.temp);

  @override
  _vindetails createState() => _vindetails(temp);
}

class _vindetails extends State<VinDetails> {
  var temp;
  bool isLoading = false;

  _vindetails(this.temp);

  @override
  Widget build(BuildContext context) {
    print("this is it ------------------------------");
    print(temp);
    var temp1 = json.decode(temp);
    String vin = temp1["vin"];
    String make = temp1["make"];
    String model = temp1["model"];
    String trim = temp1["trim"];
    String year = temp1["year"];
    String body_type = temp1["body_type"];
    String drive_type = temp1["drive_type"];
    String country_of_manufacture = temp1["country_of_manufacture"];
    String plant = temp1["plant"];
    String msrp = temp1["msrp"];
    String cylinders = temp1["cylinders"];
    String displacement = temp1["displacement"];
    String fuel_type = temp1["fuel_type"];
    String aspiration = temp1["aspiration"];
    String transmission = temp1["transmission"];
    String fuel_display = temp1["fuel_display"];

    if (fuel_display == null) {
      fuel_display = fuel_type;
    }
    if (fuel_type == "B") {
      fuel_display = "Bio Diesel";
    } else if (fuel_type == "D") {
      fuel_display = "Diesel";
    } else if (fuel_type == "DH") {
      fuel_display = "Diesel Hybrid";
    } else if (fuel_type == "F") {
      fuel_display = "Flex Fuel";
    } else if (fuel_type == "G") {
      fuel_display = "Gasoline/Petrol";
    } else if (fuel_type == "H") {
      fuel_display = "Hydrogen Fuel Cells";
    } else if (fuel_type == "L") {
      fuel_display = "Electric";
    } else if (fuel_type == "N") {
      fuel_display = "Natural Gas";
    } else if (fuel_type == "P") {
      fuel_display = "Propane";
    } else if (fuel_type == "Biodiesel") {
      fuel_display = "Biodiesel";
    } else if (fuel_type == "Diesel") {
      fuel_display = "Diesel";
    } else if (fuel_type == "Diesel/Electric Hybrid") {
      fuel_display = "Diesel/Electric Hybrid";
    } else if (fuel_type == "Electric") {
      fuel_display = "Electric";
    } else if (fuel_type == "Electric with Gas Generator") {
      fuel_display = "Electric with Gas Generator";
    } else if (fuel_type == "Flex Fuel") {
      fuel_display = "Flex Fuel";
    } else if (fuel_type == "Gas/Electric Hybrid") {
      fuel_display = "Gas/Electric Hybrid";
    } else if (fuel_type == "Gasoline") {
      fuel_display = "Gasoline";
    } else if (fuel_type == "Hydrogen Fuel Cell") {
      fuel_display = "Hydrogen Fuel Cell";
    } else if (fuel_type == "Natural Gas") {
      fuel_display = "Natural Gas";
    } else if (fuel_type == "Plug-in Gas/Electric Hybrid") {
      fuel_display = "Plug-in Gas/Electric Hybrid";
    } else if (fuel_type == "Propane") {
      fuel_display = "Propane";
    }

    print("ddddddddddddddddddddddddddddddddddddddd");
    print(displacement);
    String formatted_msrp =
        NumberFormat.currency().format(double.tryParse(msrp));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[600],
        title: Text(
          'Vehicle Search',
          style: TextStyle(
            fontFamily: 'Nexa',
            fontSize: 16,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 1)),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: header_small(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'VIN',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(vin,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Vehicle Make',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(make,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Vehicle Model',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(model,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Vehicle Trim',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(trim,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Year of Manf.',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(year,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Body Type',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(body_type,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Number of Cyl's",
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(cylinders,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Engine CC",
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(displacement,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Aspiration",
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(aspiration,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Fuel Type",
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(fuel_display,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Drive Type",
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(drive_type,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Text(
                    "Transmission",
                    style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                  ),
                ),
                Flexible(
                  child: Text(transmission,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontFamily: 'Nexa',
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'MSRP',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_msrp,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Manf. Plant',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(plant,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Country Manf.',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(country_of_manufacture,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
            child: CustomButton2(
              onBtnPressed: () async {
                setState(() {
                  isLoading = true;
                });
                String year1 = "01/01/" + year;

                var load = {
                  "msrp": msrp,
                  "year": year1,
                  "cc": displacement,
                  "v_type": body_type,
                  "f_type": fuel_type,
                  "vin": vin,
                  "year1": year
                };

                String load_passed = jsonEncode(load);
                var result = await calculateDuty(load_passed);

                List xx = [load, result];
                String temp = jsonEncode(xx);
                print(temp);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => duty_charges(temp),
                  ),
                );
                setState(() {
                  isLoading = false;
                });
              },
              btnText: "Calculate",
              isLoading: isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
