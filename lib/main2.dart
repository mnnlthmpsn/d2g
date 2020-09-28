/*
import 'package:flutter/material.dart';

import 'api.dart';
import 'custom_widget.dart';
import 'forgotPassword.dart' as forgotPassword;
import 'register.dart' as register;

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[600],
        accentColor: Colors.red[600]
      ),
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.red[600],
      body:
      Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Form(key: _formKey,
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
                          validator: (value){
                            if (value.isEmpty){
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
                                borderSide: BorderSide(color: Colors.white,)
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white,)
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontFamily: 'Nexa',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value){
                          if (value.isEmpty){
                            return 'Please provide Email Address';
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
                            borderSide: BorderSide(color: Colors.white,)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,)
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'Nexa',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    forgotPassword.ForgotPassword()),
                          );

                        },
                        child: Text('Reset Password',
                            style: TextStyle(
                                fontFamily: 'Nexa',
                                color: Colors.white,
                                fontSize: 12)
                        ),
                      ),
                  SizedBox(height: 20),
                      CustomButton(
                        onBtnPressed: () async {
                          if (_formKey.currentState.validate()) {
                            var email = emailController.text;
                            var password = passwordController.text;
                            setState(() {
                              message = 'Please Wait...';
                            });

                            var rsp = await loginUser(email, password);
                            print(rsp);
                            if (rsp.containsKey('status')) {
                              if (rsp['status'] == 0) {}
                            } else {
                              setState(
                                () {
                                  message = 'Login Failed';
                                },
                              );
                            }
                          }
                        }, btnText: 'Login',),
                      SizedBox(height: 20),
                      Text(message),

                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => register.Register()),
                            );
                          },
                          child: Text('Dont have an account ? Create Account',
                              style: TextStyle(
                                  fontFamily: 'Nexa',
                                  color: Colors.white,
                                  fontSize: 12)),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
