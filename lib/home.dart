import 'dart:convert';

import 'package:Duty2Go/barcodeProvider.dart';
import 'package:Duty2Go/utils/database.dart';
import 'package:provider/provider.dart';
import 'car.dart';
import 'car_db.dart';
import 'manual_entry.dart';
import 'package:flutter/material.dart';
import 'webview.dart';
import 'api.dart';
import 'custom_widget.dart';
import 'searchResults.dart';
import 'vehicle.dart';
import 'vin_history.dart';
import 'barcode.dart';
import 'car_history.dart';

class Home extends StatefulWidget {
  final String _transfer;
  final String _result;

  @override
  Home(this._transfer, this._result);

  _HomeState createState() => _HomeState(_transfer, _result);
}

class _HomeState extends State<Home> {
  var _transfer;
  var _result;

  _HomeState(this._transfer, this._result);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController vin_searchController = TextEditingController();
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
  String final_display;
  List<String> list;
  var blob;
  int sub_state = 0;

  String _email;
  String _url;
  String _state;
  var result;

  @override
  void initState() {
    super.initState();
    checksub();
  }

  @override
  void dispose() {
    vin_searchController.dispose();
    super.dispose();
  }

  updateWithScan(String result) {
    if(result != null) {
      setState(() {
        vin_searchController = result as TextEditingController;
      });
    }
  }

  checksub() async {

    if(_transfer != 'trip') {
      var transfered = json.decode(_transfer);
      _state = transfered["status"];
      _url = transfered["url"];
      _email = transfered["email"];

      if (_email != 'blank') {
        afterBuild(_email);
      } else {
        //write what happens here when non email is found or no internet
      }
    }else{
      await pullData();
      print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
      print(_email);
      if (_email != 'blank') {
        afterBuild(_email);
      }
    }
  }

  pullData() async {
    var _vinData = await DBProvider.db.getUser();
    if(_vinData != 0) {
      _email = _vinData["email"];
      _url = _vinData["url"];
      _state = _vinData["state"];
      print(_email);
    }else {
      _email = '';
      _url = 'https://duty2go.crustsolutions.com';
      _state = 'Active';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BarcodeModel>(
      builder: (context, provider, child){
        vin_searchController.text = provider.barcode;
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Duty2Go-GH'),
          ),
          body: Center(
            child: ListView(
              children: <Widget>[
                //  showDialog ? AlertBox() : Text('Never'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Logo_red_small(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(tokens),
                                  SizedBox(width: 5.0),
                                  Text(' Caps'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: EdgeInsets.only(
                                left: 0, top: 0, right: 20, bottom: 0),
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
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 250,
                                    child: Center(
                                      child: TextFormField(
                                        controller: vin_searchController,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please provide Valid VIN';
                                          }
                                          if (value.length != 17) {
                                            return 'Vin should be 17 Characters long';
                                          }
                                          return null;
                                        },
                                        textCapitalization:
                                        TextCapitalization.characters,
                                        textAlign: TextAlign.center,
                                        cursorWidth: .5,
                                        style: TextStyle(
                                          fontFamily: 'Nexa',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        decoration: InputDecoration(
                                            labelText: '  Enter VIN'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width: 210,
                                    child: FlatButton(
                                        onPressed: () async {
                                          if (sub_state == 1) {
                                            if (_formKey.currentState.validate()) {
                                              String vin =
                                                  vin_searchController.text;
                                              //var email = readEmail();
                                              //String email_conv = email.toString();
                                              List result =
                                              await tempvin(vin, _email);
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

                                              var display =
                                              await blob[0]['basic_data'];
                                              String make = display["make"];
                                              String model = display["model"];
                                              final_display = make + " " + model;

                                              // if(tokens< 0){
                                              //dont give the results
                                              //  }else{
                                              myList = list;
                                              print(myList);
                                              setState(() {
                                                final_display = make + " " + model;
                                                itemList.clear();
                                                itemList.addAll(myList);
                                              });
                                            }
                                          } else if (sub_state == 2) {
                                            _scaffoldKey.currentState
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'No Caps Remaining, Resubscribe.'),
                                              duration: Duration(seconds: 3),
                                            ));
                                          } else if (sub_state == 3) {
                                            _scaffoldKey.currentState
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Subscription renewal required.'),
                                              duration: Duration(seconds: 3),
                                            ));
                                          } else {
                                            _scaffoldKey.currentState
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Kindly check network connectivity'),
                                              duration: Duration(seconds: 3),
                                            ));
                                          }
                                        },
                                        color: Colors.red,
                                        textColor: Colors.white,
                                        child: Text('Search')),
                                  ),
                                ],
                              ),
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
                      EdgeInsets.only(left: 30, top: 0, right: 20, bottom: 0),
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
                                InputDecoration(labelText: final_display),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Container(
                            width: 160,
                            child: DropdownButton<String>(
                                hint: Text('Select Trim'),
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_downward),
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
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                          ),
                          Container(
                            width: 280,
                            child: FlatButton(
                                onPressed: () async {
                                  if (sub_state == 1) {
                                    var basic = blob[myIndex]['basic_data'];
                                    var pricing = blob[myIndex]['pricing'];
                                    var engines = blob[myIndex]['engines'];
                                    var transmissions =
                                    blob[myIndex]['transmissions'];

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
                                    String displacement =
                                    engines[0]["displacement"];
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
                                    } else if (aspiration ==
                                        "Naturally Aspirated") {
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
                                    } else if (fuel_type ==
                                        "Diesel/Electric Hybrid") {
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

                                    var newVin = Car(
                                        date: date,
                                        vin: _vin,
                                        make: make,
                                        model: model,
                                        trim: trim,
                                        year: year,
                                        body_type: body_type,
                                        drive_type: drive_type,
                                        country_of_manufacture:
                                        country_of_manufacture,
                                        plant: plant,
                                        msrp: msrp,
                                        cylinders: cylinders,
                                        displacement: displacement,
                                        fuel_type: fuel_type,
                                        aspiration: aspiration,
                                        transmission: transmission);
                                    // DBProvider.db.newVin(newVin);
                                    DBProvider.db.newCar(newVin);

                                    var temp1 = {
                                      'vin': _vin,
                                      'make': make,
                                      'model': model,
                                      'trim': trim,
                                      'year': year,
                                      'body_type': body_type,
                                      'drive_type': drive_type,
                                      'country_of_manufacture':
                                      country_of_manufacture,
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
                                  } else if (sub_state == 2) {
                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                      content: Text('No Caps Remaining'),
                                      duration: Duration(seconds: 3),
                                    ));
                                  } else if (sub_state == 3) {
                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                      content:
                                      Text('Subscription renewal required'),
                                      duration: Duration(seconds: 3),
                                    ));
                                  } else {
                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                      content:
                                      Text('Kindly check network connectivity'),
                                      duration: Duration(seconds: 3),
                                    ));
                                  }
                                },
                                color: Colors.red,
                                textColor: Colors.white,
                                child: Text('Details')),
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
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Barcode()),
                            );
                          },
                          child: Text("Barcode Scan",
                              style: TextStyle(
                                  fontFamily: 'Nexa',
                                  color: Colors.black,
                                  fontSize: 14)),
                        ),
                        SizedBox(width: 10.0),
                        Text('| |'),
                        SizedBox(width: 10.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Manual()),
                            );
                          },
                          child: Text("Manual Entry",
                              style: TextStyle(
                                  fontFamily: 'Nexa',
                                  color: Colors.black,
                                  fontSize: 14)),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
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
                          //MaterialPageRoute(builder: (context) => Vin_History()),
                          MaterialPageRoute(builder: (context) => CarHistory()),
                        );
                      },
                      child: Text("Vin History",
                          style: TextStyle(
                              fontFamily: 'Nexa',
                              color: Colors.black,
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
    );
  }

  afterBuild(String _email) async {
    var result = await checkSub(_email);
    print(result);

    if (result != null) {
      String status = result["status"];
      String desc = result["desc"];
      String _tokens = result["tokens"];

      print(_tokens);

      if (status == "555") {
        int tokens_int = int.parse(_tokens);
        if (tokens_int >= 0) {
          sub_state = 1;
          setState(() {
            tokens = tokens_int.toString();
          });

          //display tokens
        } else if (status == "666" || (status == "667")) {
          sub_state = 2;
          setState(() {
            tokens = '0';
          });
          //disable search
          //enable manual search
          //display message to subscribe
        }
      } else {
        sub_state = 3;
        setState(() {
          tokens = '0';
        });
        //no active subscripion
        //disable all
        //display message to subscribe
      }
    } else {
      sub_state = 4;
      setState(() {
        tokens = '_';
      });
      //disable all tins
      //message to check internet connection
    }
    // executes after build is done
    //int token_int;
    //token_int = int.parse(tokens);
    sub_state != 1 ? showAlertDialog(_url, context) : print('Customer has no tokens');
  }

}

showAlertDialog(String _url, BuildContext context) {
  //  buttons
  print(_url);
  print("we right here ======================================================");
  Widget cancelButton = FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.pop(context);
        print('cancel');
      });
  Widget continueButton = FlatButton(
    child: Text('Subscribe'),
    onPressed: () {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => MyWebView(
            title: "Renew Subscription",
            selectedUrl: _url,
          )));
      print('ok');
    },
  );

  //  setup alertdialog
  AlertDialog alert = AlertDialog(
    title: Text('Renew Subscription'),
    content: Text('You currently dont have any tokens. Resubscribe to purchase..?'),
    actions: [cancelButton, continueButton],
  );

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      });
}






