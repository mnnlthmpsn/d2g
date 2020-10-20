import 'package:flutter/material.dart';
import 'package:Duty2Go/custom_widget.dart';
import 'home.dart';
import 'dart:convert';
import 'api.dart';
import 'dutyCharges.dart';


class Manual extends StatefulWidget {
  @override
  _manualEntry createState() => _manualEntry();
}

class _manualEntry extends State<Manual> {
  List<String> _fuel;
  List<String> _body;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _costform = TextEditingController();
  TextEditingController _yearform = TextEditingController();
  TextEditingController _ccform = TextEditingController();
  String _bodyform;
  String _fuelform;

  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual Entry'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              String _transfer = 'trip';
              return Home(_transfer, null);
            }));
          },
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 50,
                            width: 400,
                            margin: EdgeInsets.only(
                                left: 30, top: 0, right: 30, bottom: 0),
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(child: header_small(),),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.1,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text('Vehicle Cost (HDV) \$'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 3.5, 10, 0),
                                      child: SizedBox(
                                        width: 100,
                                        child: TextFormField(
                                          controller: _costform,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please provide Vehicle MSRP';
                                            }
                                          },

                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '25,000.00',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.1,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text('Year of Manufacture'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 3.5, 10, 0),
                                      child: SizedBox(
                                        width: 100,
                                        child: TextFormField(
                                          controller: _yearform,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please provide Year of Manufacture';
                                            }
                                          },
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '2012',
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.1,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text('Engine CC. in Ltrs'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 3.5, 10, 0),
                                      child: SizedBox(
                                        width: 100,
                                        child: TextFormField(
                                          controller: _ccform,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please provide Engine CC in Litres';
                                            }
                                          },
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '2.0',
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.1,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text('Fuel Type'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 3.5, 10, 0),
                                      child: SizedBox(
                                        width: 200,
                                        child: DropdownButtonFormField<String>(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please provide Fuel type';
                                            }
                                          },
                                          decoration: InputDecoration.collapsed(
                                              hintText: 'Select'),
                                          items: <String>[
                                            'Petrol',
                                            'Diesel',
                                            'Flex Fuel',
                                            'Gasoline',
                                            'Plug-in Hybrid',
                                            'Electric',
                                            'Natural Gas',
                                            'BioDiesel',
                                            'Gas/Electric Hybrid'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String value) {
                                            print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
                                            print(value);
                                            setState(() {
                                             // _fuel = value as List<String>;
                                              _fuelform = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.1,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text('Body Type'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 3.5, 10, 0),
                                      child: SizedBox(
                                        width: 200,
                                        child:DropdownButtonFormField<String>(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please provide Vehicle Body type';
                                            }
                                          },
                                          decoration: InputDecoration.collapsed(
                                              hintText: 'Select'),
                                          items: <String>[
                                            'Sedan',
                                            'Coupe',
                                            'Estate',
                                            'Convertible',
                                            'Wagon',
                                            'SUV',
                                            'Cross Country',
                                            'Pick Up',
                                            'Mini Van'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value1) {
                                            return DropdownMenuItem<String>(
                                              value: value1,
                                              child: Text(value1),
                                            );
                                          }).toList(),
                                          onChanged: (String value1) {
                                            setState(() {
                                              //_body = value1 as List<String>;
                                              _bodyform = value1.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                          child: CustomButton2(
                            btnText: 'Process',
                            onBtnPressed: () async {
                            if (_formKey.currentState.validate()) {
                              var zcost = _costform.text;
                              var zyear =  _yearform.text;
                              var zcc = _ccform.text;
                              var zfuel =  _fuelform;
                              var zbody =  _bodyform;

                              setState(() {
                                message = 'Please Wait...';
                              });

                              String year1 = "01/01/" + zyear;

                              var load = {
                                "msrp": zcost,
                                "year": year1,
                                "cc": zcc,
                                "v_type": zfuel,
                                "f_type": zbody,
                                "vin": 'No VIN',
                                "year1": zyear
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

                            };


                            },
                          ),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
