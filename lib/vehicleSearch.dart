import 'package:flutter/material.dart';
import 'searchResults.dart' as sr;

class VehicleSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[600],
        automaticallyImplyLeading: false,
        title: Text(
          'Duty2Go - GH',
          style: TextStyle(
            fontFamily: 'Nexa',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    textAlign: TextAlign.center,
                    cursorWidth: .5,
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                      ),
                      labelText: 'Enter A VIN',
                      labelStyle: TextStyle(
                        fontFamily: 'Nexa',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: FlatButton(
                    onPressed: () {

                    },
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    splashColor: Colors.white,
                    color: Colors.red[600],
                    child: Text(
                      'Search',
                      style: TextStyle(
                        fontFamily: 'Nexa',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
