import 'package:flutter/material.dart';
import 'dart:convert';
import 'api.dart';
import 'car_db.dart';
import 'custom_widget.dart';
import 'forgotPassword.dart';
import 'register.dart' as register;
import 'vin_search.dart';
import 'home.dart';
import 'user.dart';
import 'package:Duty2Go/utils/database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  // ignore: top_level_instance_getter
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;
  String message = '';
  String email = '';
  String url = '';
  String state = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    pullData();
    super.initState();
  }

  getState() async{

    var _returned = await getstate_();
    String _status;
    String _string;
    String _msg;

    if(_returned != null){
      _status = _returned["status"];
      _string = _returned["string"];
      _msg = _returned["msg"];
    }else{
      //do what no internet does
    }

    List block = [_status, _string, _msg];
    return block;
  }


  pullData() async {
    var _vinData = await DBProvider.db.getUser();
    if(_vinData != 0) {
      email = _vinData["email"];
      url = _vinData["url"];
      state = _vinData["state"];
      print(email);
      setState(() {
        emailController.text = email.toString();
      });

    }else {
      email = '';
      url = 'https://duty2go.crustsolutions.com';
      state = 'Active';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.red[600],
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Logo_white(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please provide Email Address';
                            }
                            return null;
                          },
                          autofocus: false,
                          cursorColor: Colors.white,
                          cursorWidth: .5,
                          style: TextStyle(
                            fontFamily: 'Nexa',
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontFamily: 'Nexa',
                              color: Colors.white,
                            ),
                            errorStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return ("Please provide a Password");
                          }
                          return null;
                        },
                        obscureText: true,
                        cursorColor: Colors.white,
                        cursorWidth: .5,
                        style: TextStyle(
                          fontFamily: 'Nexa',
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'Nexa',
                            color: Colors.white,
                          ),
                          errorStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return Password_reset();
                              }));
                        },
                        child: Text('Reset Password',
                            style: TextStyle(
                                fontFamily: 'Nexa',
                                color: Colors.white,
                                fontSize: 12)),
                      ),
                      SizedBox(height: 20),
                      CustomButton1(
                        onBtnPressed: () async {
                          if (_formKey.currentState.validate()) {
                            var _email = emailController.text;
                            var password = passwordController.text;
                            setState(() {
                              isLoading = true;
                            });

                            var rsp = await loginUser(_email, password);
                            print(rsp);

                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(_email);
                            if (emailValid) {
                              if (rsp != null) {
                                if (rsp == '0') {

                                  List Listreturned = await getState();

                                  var currentUser = User(email: _email,
                                      url: url,
                                      state: state);
                                  DBProvider.db.updateUser(currentUser);

                                  var transfer = {
                                    'email': _email,
                                    'url': Listreturned.elementAt(1),
                                    'state': Listreturned.elementAt(0)
                                  };

                                  String _transfer = jsonEncode(transfer);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Home(_transfer, null);
                                  }));
                                } else {
                                  setState(
                                    () {
                                      message =
                                          'Enter correct Email and Password';
                                    },
                                  );
                                }
                              } else {
                                setState(
                                  () {
                                    message = 'Login Failed';
                                  },
                                );
                              }
                            } else {
                              setState(
                                () {
                                  message = 'Enter a valid Email Address';
                                },
                              );
                            }
                          }
                        },
                        btnText: 'Login',
                        loader: SpinKitCircle(
                          color: Colors.red[600],
                          size: 20.0,
                        ),
                        isLoading: isLoading,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => register.Register()),
                            );
                          },
                          child: Text("Don't have an account ? Sign Up",
                              style: TextStyle(
                                  fontFamily: 'Nexa',
                                  color: Colors.white,
                                  fontSize: 12)),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(message,
                          style: TextStyle(
                            fontFamily: 'Nexa',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),

                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
