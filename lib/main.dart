import 'package:flutter/material.dart';
import 'intro.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.red[600],
          accentColor: Colors.white,

      ),
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}