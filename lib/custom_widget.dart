import 'package:flutter/material.dart';

class Logo_white extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(child: Image.asset('assets/logo_white.png'),
      width: MediaQuery.of(context).size.width*0.3,
      height: MediaQuery.of(context).size.height*0.3,
    );
  }
}
class Logo_white_small extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(child: Image.asset('assets/logo_white.png'),
      width: MediaQuery.of(context).size.width*0.15,
      height: MediaQuery.of(context).size.height*0.15,
    );
  }
}

class Logo_red extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(child: Image.asset('assets/logo_red.png'),
      width: MediaQuery.of(context).size.width*0.3,
      height: MediaQuery.of(context).size.height*0.3,
    );
  }
}

class Logo_red_small extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(child: Image.asset('assets/logo_red.png'),
      width: MediaQuery.of(context).size.width*0.15,
      height: MediaQuery.of(context).size.height*0.15,
    );
  }
}

class CustomButton1 extends StatelessWidget {

  final String btnText;
  final Function onBtnPressed;
  CustomButton1({this.btnText, this.onBtnPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              btnText,
              style: TextStyle(
                fontFamily: 'Nexa',
                color: Colors.red[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onPressed: onBtnPressed,
      color: Colors.white,
    );
  }
}

class CustomButton2 extends StatelessWidget {

  final String btnText;
  final Function onBtnPressed;
  CustomButton2({this.btnText, this.onBtnPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              btnText,
              style: TextStyle(
                fontFamily: 'Nexa',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onPressed: onBtnPressed,
      color: Colors.red[600],
    );
  }
}

class CustomButton extends StatelessWidget {

  final String btnText;
  final Function onBtnPressed;
  CustomButton({this.btnText, this.onBtnPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              btnText,
              style: TextStyle(
                fontFamily: 'Nexa',
                color: Colors.red[600],
                fontWeight: FontWeight.bold,
        ),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
      onPressed: onBtnPressed,
      color: Colors.white,
    );
  }
}

class header_small extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(child: Image.asset('assets/header.png'),
      //width: MediaQuery.of(context).size.width*0.15,
     // height: MediaQuery.of(context).size.height*0.15,
    );
  }
}

