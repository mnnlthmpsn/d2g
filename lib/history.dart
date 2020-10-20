/*
import 'dart:core';

import 'package:Duty2Go/utils/database.dart';
import 'package:Duty2Go/vehicle.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _history createState() => _history();
}

class _history extends State<History> {
  Map<String, String> newVin = {};
  //Future _vinFuture;
  Future _vinFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vinFuture = getVin();
  }

  getVin() async {
    final _vinData = await DBProvider.db.getVin();
    return _vinData;
  }

  refreshList(){
  }

*/
/*  dataTable(List<Vehicle> vehicle) {
    //dataTable(List<Vehicle> vehicle) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
            columns: [
              DataColumn(label: Text("Date")),
              DataColumn(label: Text("VIN")),
              DataColumn(label: Text("DELETE")),
            ],
            rows: vehicle.map((vehicle) => DataRow(cells: [
                  DataCell(
                    Text(vehicle.date),
                  ),
                  DataCell(
                    Text(vehicle.vin),
                  ),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ]))));
  }*//*


*/
/*  list() {
    return Expanded(
      child: FutureBuilder(
          future: _vinFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return dataTable(snapshot.data);
            }
            if (null == snapshot.data || snapshot.data.lenght == 0) {
              return Text("No VIN History Found");
            }
            return CircularProgressIndicator();
          }),
    );
  }*//*


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
      body: FutureBuilder(
        future: _vinFuture,
        builder: (_, _vinData) {
          switch (_vinData.connectionState) {
            case ConnectionState.none:
              return Container();
            case ConnectionState.waiting:
              return Container();
            case ConnectionState.active:
            case ConnectionState.done:
              if (!newVin.containsKey('vin')) {
              // newVin = Map<String, String>.from(_vinData.data);
               List newVin1 = _vinData.data;
               print('-----------------%%%%%%%%%---------------------');
               print(newVin1);

               List <String> drop =  [];
               for(var i = 0; i < newVin1.length; i++){
                 String _date = newVin1[i]["date"];
                 String _vin = newVin1[i]["vin"];
                 String _make = newVin1[i]["make"];
                 String _concat = _date + " - " + _vin + " - " + _make;
                 print(_concat);
                 drop.add(_concat);
               }

               dataTable(List _concat) {
                 //dataTable(List<Vehicle> vehicle) {
                 return SingleChildScrollView(
                     scrollDirection: Axis.vertical,
                     child: DataTable(
                         rows: _concat,
               }
               dataTable(_concat);



              }
          }
          return Container();
        },
      ),
      body : new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            verticalDirection: VerticalDirection.down,
            children:<Widget>[
              list(),
            ]
        ),
      ),
    );
  }
}

 dataTable(_concat) {
    //dataTable(List<Vehicle> vehicle) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
            columns: [
              DataColumn(label: Text("Data")),
              DataColumn(label: Text("DELETE")),
            ],
            rows: _concat.map((vehicle) => DataRow(cells: [
                  DataCell(
                    Text(_concat),
                  ),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ]))));
  }
*/
