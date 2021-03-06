/*
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';

import 'dart:convert';
import 'package:Duty2Go/utils/database.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'custom_widget.dart';
import 'searchResults.dart';
import 'vehicle.dart';
import 'history.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  @override
  void initState() async {
    await afterBuild();
  }
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final vin_searchController = TextEditingController();
  String _value = '1';
  bool isLoading = false;

  // String _mySelection = 'Empty';
  List<String> myList;
  List<String> itemList = [];
  String dropdownValue;
  int myIndex;

  String _styles;
  String tokens = "";
  String status;
  String _vin;
  String makeAndmodel = '';
  List<String> list;
  var blob;

  @override
  void dispose() {
    vin_searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[600],
        automaticallyImplyLeading: false,
        title: Text('Duty2Go-GH'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Logo_red(),
                          ),
                          Text(tokens),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        margin: EdgeInsets.only(
                            left: 0, top: 0, right: 30, bottom: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 40,
                              offset:
                              Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 210,
                              child: Center(
                                child: TextFormField(
                                  decoration:
                                  InputDecoration(labelText: 'Enter VIN'),
                                ),
                              ),
                            ),
                            CustomButton2(
                              onBtnPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  String vin = vin_searchController.text;
                                  //var email = readEmail();
                                  //String email_conv = email.toString();
                                  List result =
                                  await tempvin(vin, "padmorey@gmail.com");
                                  //result = json.decode(result);
                                  status = result.elementAt(0);
                                  list = result.elementAt(1);
                                  tokens = result.elementAt(2);
                                  blob = result.elementAt(3);
                                  _vin = vin;
                                  print(status);
                                  print(list);
                                  print(tokens);
                                  print(blob);
                                  print(list);
                                  // if(tokens< 0){
                                  //dont give the results
                                  //  }else{
                                  myList = list;
                                  print(myList);
                                  setState(() {
                                    itemList.clear();
                                    itemList.addAll(myList);
                                  });
                                }
                                //  }else{
                                //enter error message
                                //    }
                              },
                              btnText: 'Search',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Container(
                  height: 250,
                  width: 400,
                  margin:
                  EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 40,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Container(
                        width: 300,
                        child: Center(
                          child: TextFormField(
                            decoration:
                            InputDecoration(labelText: makeAndmodel),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Container(
                        width: 80,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          items: itemList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              myIndex = myList.indexOf(newValue);
                              print(myIndex);
                            });
                          },
                          isDense: true,
                          hint: new Text("Select Trim"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                      ),
                      Container(
                          width: 80,
                          child: CustomButton1(
                              btnText: 'Details',
                              onBtnPressed: () async {
                                var basic = blob[myIndex]['basic_data'];
                                var pricing = blob[myIndex]['pricing'];
                                var engines = blob[myIndex]['engines'];
                                var transmissions = blob[myIndex]['transmissions'];

                                print(basic);
                                print(pricing);

                                String make = basic["make"];
                                String model = basic["model"];
                                String trim = basic["trim"];
                                String year = basic["year"];
                                String body_type = basic["body_type"];
                                String drive_type = basic["drive_type"];
                                String country_of_manufacture =
                                basic["country_of_manufacture"];
                                String plant = basic["plant"];
                                String msrp = pricing["msrp"];
                                String cylinders = engines[0]["cylinders"];
                                String displacement = engines[0]["displacement"];
                                String fuel_type = engines[0]["fuel_type"];
                                String aspiration = engines[0]["aspiration"];
                                String transmission = transmissions[0]["name"];
                                String fuel_type1;

                                if (aspiration == "N/A") {
                                  aspiration = "Naturally Aspirated";
                                } else if (aspiration == "T") {
                                  aspiration = "Turbocharger";
                                } else if (aspiration == "SC") {
                                  aspiration = "Supercharger";
                                } else if (aspiration == "TT") {
                                  aspiration = "Twin Turbocharger";
                                } else if (aspiration == "QT") {
                                  aspiration = "Quad Turbocharger";
                                } else if (aspiration == "TW") {
                                  aspiration =
                                  "Twincharger (Turbocharger + Supercharger)";
                                } else if (aspiration == "Naturally Aspirated") {
                                  aspiration = "Naturally Aspirated";
                                } else if (aspiration == "Quad Turbo") {
                                  aspiration == "Quad Turbo";
                                } else if (aspiration == "Supercharged") {
                                  aspiration = "Supercharged";
                                } else if (aspiration == "Turbo") {
                                  aspiration = "Turbo";
                                } else if (aspiration == "Twin Turbo") {
                                  aspiration = "Twin Turbo";
                                } else if (aspiration ==
                                    "Twincharged (Turbocharger + Supercharger") {
                                  aspiration =
                                  "Twincharged (Turbocharger + Supercharger";
                                }

                                if (fuel_type == "B") {
                                  fuel_type1 = "Bio Diesel";
                                } else if (fuel_type == "D") {
                                  fuel_type1 = "Diesel";
                                } else if (fuel_type == "DH") {
                                  fuel_type1 = "Diesel Hybrid";
                                } else if (fuel_type == "F") {
                                  fuel_type1 = "Flex Fuel";
                                } else if (fuel_type == "G") {
                                  fuel_type1 = "Gasoline/Petrol";
                                } else if (fuel_type == "H") {
                                  fuel_type1 = "Hydrogen Fuel Cells";
                                } else if (fuel_type == "L") {
                                  fuel_type1 = "Electric";
                                } else if (fuel_type == "N") {
                                  fuel_type1 = "Natural Gas";
                                } else if (fuel_type == "P") {
                                  fuel_type1 = "Propane";
                                } else if (fuel_type == "Biodiesel") {
                                  fuel_type1 = "Biodiesel";
                                } else if (fuel_type == "Diesel") {
                                  fuel_type1 = "Diesel";
                                } else if (fuel_type == "Diesel/Electric Hybrid") {
                                  fuel_type1 = "Diesel/Electric Hybrid";
                                } else if (fuel_type == "Electric") {
                                  fuel_type1 = "Electric";
                                } else if (fuel_type ==
                                    "Electric with Gas Generator") {
                                  fuel_type1 = "Electric with Gas Generator";
                                } else if (fuel_type == "Flex Fuel") {
                                  fuel_type1 = "Flex Fuel";
                                } else if (fuel_type == "Gas/Electric Hybrid") {
                                  fuel_type1 = "Gas/Electric Hybrid";
                                } else if (fuel_type == "Gasoline") {
                                  fuel_type1 = "Gasoline";
                                } else if (fuel_type == "Hydrogen Fuel Cell") {
                                  fuel_type1 = "Hydrogen Fuel Cell";
                                } else if (fuel_type == "Natural Gas") {
                                  fuel_type1 = "Natural Gas";
                                } else if (fuel_type ==
                                    "Plug-in Gas/Electric Hybrid") {
                                  fuel_type1 = "Plug-in Gas/Electric Hybrid";
                                } else if (fuel_type == "Propane") {
                                  fuel_type1 = "Propane";
                                }

                                String date = getdate().toString();

                                var newVin = Vehicle(date: date,
                                    vin: _vin,
                                    make: make,
                                    model: model,
                                    trim: trim,
                                    year: year,
                                    bodyType: body_type,
                                    driveType: drive_type,
                                    countryOfManufacture: country_of_manufacture,
                                    plant: plant,
                                    msrp: msrp,
                                    cylinders: cylinders,
                                    displacement: displacement,
                                    fuelType: fuel_type,
                                    aspiration: aspiration,
                                    transmission: transmission);
                                DBProvider.db.newVin(newVin);



                                var temp1 = {
                                  'vin': _vin,
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
                                  'fuel_display': fuel_type1
                                };

                                String temp = jsonEncode(temp1);

                                print(temp);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VinDetails(temp),
                                  ),
                                );
                              })
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Barcode Scan'),
                    SizedBox(width: 10.0),
                    Text('| |'),
                    SizedBox(width: 10.0),
                    Text('Manual Entry')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            ),
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => History()),
                    );
                  },
                  child: Text("Vin History",
                      style: TextStyle(
                          fontFamily: 'Nexa',
                          color: Colors.white,
                          fontSize: 12)),
                ),
                Divider(),
                Text('Text 1'),
                Divider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

afterBuild() async {
  String value;
  String data;
  var result = await checkSub("padmorey@gmail.com");
  print(result);

  if (result != null) {
    String status = result["status"];
    String desc = result["desc"];
    String tokens = result["tokens"];

    if (status == "555") {
      int tokens_int = int.parse(tokens);
      if (tokens_int >= 0) {
        value = '1';
        //display tokens
      } else {
        value = '2';
        //disable search
        //enable manual search
        //display message to subscribe
      }
    } else {
      value = '3';
      //no active subscripion
      //disable all
      //display message to subscribe
    }
  } else {
    value = '4';
    //disable all tins
    //message to check internet connection
  }

  if (value == '1') {
    print('-------------------------------------------------------');
    return true;
  } else {
    print('------iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
    return false;
  }

  // executes after build is done
}*/
