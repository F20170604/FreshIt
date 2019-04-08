import 'package:flutter/material.dart';
import 'package:freshit_flutter/AppTheme.dart';

class SignInTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
        child: new Text("FreshIt",
          style: TextStyle(
              fontSize: 80.0,
              fontFamily: AppTheme.primaryFont,
              letterSpacing: 0.25,
              color: AppTheme.primaryColor,
              shadows: <Shadow>[
                Shadow(
                    offset: Offset(4.0, 4.0),
                    blurRadius: (5.0),
                    color: Color.fromRGBO(100, 100, 100, 1.0)
                )
              ]
          ),
        ),
      ),
      /*decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width:3)
       ),*/
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(40.0),
    );
  }
}