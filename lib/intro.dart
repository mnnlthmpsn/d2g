import 'package:flutter/material.dart';
import 'custom_widget.dart';
import 'login.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.red[600],
      body: Stack(
        children: <Widget>[
      /*    Positioned(
            top: 0,
            child: Container(child: Image.asset('assets/decode.png'),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
            ),
          ),*/
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: CustomButton(
                btnText: 'Getting Started', onBtnPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return Login();
                    })
                );
              },

              ),
            ),
          ),
        ],
      ),

    );
  }
}





