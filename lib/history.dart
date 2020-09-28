import 'package:Duty2Go/utils/database.dart';
import 'package:Duty2Go/vehicle.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _history createState() => _history();
}

class _history extends State<History> {
  Map<String, String> newVin = {};
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
                //newVin = Map<String, String>.from(_vinData.data);
                print(Map<String, String>.from(_vinData.data));
              }
              return Column(
                children: <Widget>[Text(newVin['date']), Text(newVin['vin'])],
              );
          }
          return Container();
        },
      ),
    );
  }
}
