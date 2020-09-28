import 'package:flutter/material.dart';
import 'main.dart' as home;
import 'login.dart' as login;
import 'custom_widget.dart';
import 'api.dart';
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _register createState() => _register();
}

class _register extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirm_passwordController = TextEditingController();
  String message = '';

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
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Logo_white_small(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: firstnameController,
                      validator: (value) {
                        if (value.isEmpty || value.length < 2) {
                          return ("Please provide a valid First Name");
                        }
                        return null;
                      },

                      style: TextStyle(
                        fontFamily: 'Nexa',
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: 'Firstname',
                        labelStyle: TextStyle(
                          fontFamily: 'Nexa',
                          color: Colors.white,
                        ),
                        errorStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: lastnameController,
                      validator: (value) {
                        if (value.isEmpty || value.length < 2) {
                          return ("Please provide a valid Last Name");
                        }
                        return null;
                      },
                      style: TextStyle(
                        fontFamily: 'Nexa',
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: 'Lastname',
                        labelStyle: TextStyle(
                          fontFamily: 'Nexa',
                          color: Colors.white,
                        ),
                        errorStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: emailController,

                      validator: (value) {
                        bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);

                        if (value.isEmpty || emailValid==false) {
                          return ("Please provide a valid email address");
                        }
                        return null;
                      },
                      style: TextStyle(
                        fontFamily: 'Nexa',
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'Nexa',
                          color: Colors.white,
                        ),
                        errorStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return ("Please provide a password, 4 to 6 characters long");
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(
                        fontFamily: 'Nexa',
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: '6 digit Password (Code)',
                        labelStyle: TextStyle(
                          fontFamily: 'Nexa',
                          color: Colors.white,
                        ),
                        errorStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: confirm_passwordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ("Passwords do not match");
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(
                        fontFamily: 'Nexa',
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: 'Confirm Passcode',
                        labelStyle: TextStyle(
                          fontFamily: 'Nexa',
                          color: Colors.white,
                        ),
                        errorStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomButton1(
                    onBtnPressed: () async {

                      if (_formKey.currentState.validate()) {

                        var firstname = firstnameController.text;
                        var lastname =  lastnameController.text;
                        var email = emailController.text;
                        var password =  passwordController.text;
                        var confimrpassword =  confirm_passwordController.text;

                        setState(() {
                          message = 'Please Wait...';
                        });

                            if(password == confimrpassword){

                              var load = {
                                "first_name": firstname,
                                "last_name": lastname,
                                "email": email,
                                "pin": password
                              };

                              String load_passed = jsonEncode(load);
                              String result = await signup(load_passed);

                              if(result == "0"){
                                message = 'Account Created Successfully';
                              }else if(result == "2"){
                                message = 'Please provide unique email address..';
                              }else{
                                message = 'Account Creation failed, check connectivity..';
                              }

                            }else{
                            message = 'Passwords mismatch..';
                          }
                      }

                    },
                    btnText: 'Register',
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => login.Login()),
                        );
                      },
                      child: Text('Have an account? Login',
                          style: TextStyle(
                              fontFamily: 'Nexa',
                              color: Colors.white,
                              fontSize: 12)),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(message,
                      style: TextStyle(
                        fontFamily: 'Nexa',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
