
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

loginUser(String email, String password) async {

  String status = "";
  var data = {
    "email": 'padmorey@gmail.com',
    "pin": '123456'
  };
  var url = "https://crustsolutionsgh.com:8208/userLogin";
  var encoded = json.encode(data);
  var response =
  await http.post(url, headers: {"Accept": "application/json"}, body: encoded);

  var result = json.decode(response.body);
  print(result);

  var _status = response.statusCode;

  if (_status == 200){
    status = result["status"];
  }else {
    status = "F";
  }
  return status;
}

tempvin(String vin, String email) async {

  String _value;
  final uri = 'https://crustsolutionsgh.com:8208/testSearchWithVinAPI';
  var requestBody = {
    'vin': vin,
    'imei': email
  };
  http.Response response = await http.post(
    uri,
    body: requestBody,
  );

  var result = json.decode(response.body);
  var status = result["resp_code"];
  var _styles = result["us_styles"];
  var tokens = result["subscription_cap"];

    List <String> styles =  [];
    for(var i = 0; i < _styles.length; i++){
      _value = _styles[i]["name"];
      print(_value);
      styles.add(_value);
    }

  List backblock = [status, styles, tokens, _styles];
  return backblock;
}

calculateDuty(String load_passed) async {

  print(load_passed);
  //var load = json.encode(load_passed);
  //print(load);
  var url = "https://crustsolutionsgh.com:8208/calculate_duty";
  var response =
  await http.post(url, headers: {"Accept": "application/json"}, body: load_passed);

  var result = json.decode(response.body);
  print(result);

  var _status = response.statusCode;
  return result;
}

checkSub(String email) async {

  var Block;
  final uri = 'https://crustsolutionsgh.com:8208/testCapFunction';
  var requestBody = {
    'imei': email
  };
  http.Response response = await http.post(
    uri,
    body: requestBody,
  );

  var result = json.decode(response.body);
  print(result);

  var status = result["resp_code"];
  String description =  result["resp_desc"];
  String tokens = result["subscription_cap"];

  print(status);

  if (status == "555"){
    Block = {
      'status': status,
      'desc': description,
      'tokens': tokens
    };
  }else if(status == "666" || status == "667"  ){
    Block = {
      'status': "You need to subscribe to this service.."
    };
  }else {
    Block = {
      'status': "Connection Failed"
    };
  }

  print(Block);
  return Block;
}

getRate() async {
  double rate;
  var url = "https://crustsolutionsgh.com:8208/dollar_rate";
  var response =
  await http.get(url, headers: {"Accept": "application/json"});

  var result = json.decode(response.body);
  print(result);

  var _status = response.statusCode;

  if(_status == 200){
    String value = result['rate_value'];
    rate = double.tryParse(value);
  }else{
    rate = null;
  }

  return rate;
}

getstate_() async {
  var data;
  var url = "https://crustsolutionsgh.com:8208/status";
  var response =
  await http.get(url, headers: {"Accept": "application/json"});

  var result = json.decode(response.body);
  print(result);

  var _status = response.statusCode;

  if(_status == 200){
    data = result;
  }else{
    data = null;
  }
  return data;
}

signup(String load_passed) async {

  print(load_passed);
  //var load = json.encode(load_passed);
  //print(load);
  var url = "https://crustsolutionsgh.com:8208/newUser";
  var response =
  await http.post(url, headers: {"Accept": "application/json"}, body: load_passed);

  var result = json.decode(response.body);
  print(result);

  String _status = result['status'];

  return _status;
}

resetPassword(String load_passed) async {

  print(load_passed);
  //var load = json.encode(load_passed);
  //print(load);
  var url = "https://crustsolutionsgh.com:8208/changePin";
  var response =
  await http.post(url, headers: {"Accept": "application/json"}, body: load_passed);

  var result = json.decode(response.body);
  print('---------------------------------------------');
  print(result);

  String _status = result['status'];

  return _status;
}

getdate() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(now);
  return formatted;
}







