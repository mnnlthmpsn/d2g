import 'dart:convert';
import 'searchResults.dart';
import 'package:flutter/material.dart';
import 'car_db.dart';

class CarHistory extends StatefulWidget {
  @override
  _carHistory createState() => _carHistory();
}

class _carHistory extends State<CarHistory> {
  // data for testing

  //List<Car> testVins = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("VIN HISTORY")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DBProvider.db.getAllCars(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      String find = snapshot.data[index]['vin'];
                      var block = await DBProvider.db.getCar(find);
                      var temp = jsonEncode(block);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VinDetails(temp),
                        ),
                      );

                    },
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Text(snapshot.data[index]['vin'],
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0)),
                          Divider()
                     ])),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
