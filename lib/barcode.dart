
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';


class Barcode extends StatefulWidget {
  @override
  _barcodeapp createState() => _barcodeapp();
}

class _barcodeapp extends State<Barcode> {
  String barcode = "";
  String result = null;

  @override
  initState() {
    super.initState();
    result = barcodeScanning().toString();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return Home('trip', result);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Barcode Scanner - googleflutter.com'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: RaisedButton(
                    onPressed: barcodeScanning,
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
              ],
            ),
          )),
    );
  }

  //scan barcode asynchronously
  Future barcodeScanning() async {
    String result = "No Value";
    try {
      String barcode = await BarcodeScanner.scan().toString();
      result = barcode;
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.barcode = 'No camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
      'Nothing captured.');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
    return result;
  }
}