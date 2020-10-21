import 'package:flutter/material.dart';

class BarcodeModel with ChangeNotifier {
  String _barcode = '';

  // get barcode
  String get barcode => _barcode;

  // set barcode
  void updateBarcode(String text){
    _barcode = text;
    notifyListeners();
  }
}