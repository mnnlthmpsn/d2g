import 'package:flutter/material.dart';

import 'api.dart';
import 'custom_widget.dart';
import 'forgotPassword.dart';
import 'register.dart' as register;
import 'vin_search.dart';
import 'home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  // ignore: top_level_instance_getter
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';

  @override
  void start() {
    emailController.text = readEmail();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                            var email = emailController.text;
                            var password = passwordController.text;
                            setState(() {
                              message = 'Please Wait...';
                            });

                            var rsp = await loginUser("padmorey@gmaild.com", "123456");
                            print(rsp);

                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email);
                            if (emailValid) {
                              if (rsp != null) {
                                if (rsp == '0') {
                                  writeEmail(email);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Home();
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
