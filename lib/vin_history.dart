/*
import 'dart:core';
import 'package:Duty2Go/utils/database.dart';
import 'package:Duty2Go/vehicle.dart';
import 'package:flutter/material.dart';

import 'car_db.dart';


class Vin_History extends StatefulWidget {
  @override
  _vinhistory createState() => _vinhistory();
}

class _vinhistory extends State<Vin_History> {
  Map<String, String> newVin = {};
  List<Map> vehicle;
  List data = [];
  List block = [];
  List display = [];

  //Future _vinFuture;
  Future _vinFuture;

  @override
  void initState() {
    // TODO: implement initState
    data = pullData();
    print('================================================');
    print(data);
    display = getVin();
    super.initState();
  }

  pullData() async{
    final _vinData = await DBProvider.db.getVin();
    block = _vinData;
    return _vinData;
  }

  getVin() {
    //final _vinData =  DBProvider.db.getVin();
    //return _vinData;

*/
/*    await DBProvider.db.getVin().then((value) {
      if (value != null) value.forEach((item) => data.add(item));
    });*//*


     String _data;
    List <String> _list =  [];
    for(var i = 0; i < data.length; i++){
      _data = data[i]["VIN"];
      print(_data);
      _list.add(_data);
    }

    print(_list);
    return _list;
    //return data.toList();
    //return data == null ? [] : data;
  }

  DataTable dataBody() {
    return DataTable(
      columns: [
        DataColumn(
            label: Text("DATE"), numeric: false, tooltip: "This is the vin"),
        DataColumn(
            label: Text("VIN"), numeric: false, tooltip: "This is the date"),
        DataColumn(
            label: Text("Model"), numeric: false, tooltip: "This is the model"),
      ],
      rows: display
          .map(
            (data) => DataRow(cells: [
              DataCell(
                Text(data.date),
              ),
              DataCell(Text(data.vin), onTap: () {
                print('Selected ${data.vin}');
              }),
              DataCell(
                Text(data.model),
              ),
            ]),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.red[600],
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        bottomOpacity: 1.0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text("VIN History"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
            child: dataBody(),
          )
        ],
      ),
    );
  }
}*/
