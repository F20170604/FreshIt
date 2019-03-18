import 'package:flutter/material.dart';

class SignInFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Text(
            "New User?",
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          new FlatButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: ()=>null,
            child: new Text(
              "Create an account",
              style: new TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
    );
  }

}