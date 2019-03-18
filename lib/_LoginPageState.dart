import 'package:flutter/material.dart';
import 'title.dart';
import '_SignInFooter.dart';
class LoginPage extends StatefulWidget {

  final ValueChanged<bool> onLogin;
  LoginPage(this.onLogin);

  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }

}

class _LoginData {
  String email;
  String password;
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        new SignInTitle(),
        new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                    hintText: 'you@example.com',
                    labelText: 'Email',
                  ),
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                new TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                    labelText: 'Password',
                  ),
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  width: screenSize.width,
                  child: new RaisedButton(
                    onPressed: ()=>_checkDetails(),
                    padding: EdgeInsets.all(10),
                    child: new Text(
                      "SignIn",
                      style: new TextStyle(
                        fontSize: 27,
                        fontFamily: 'flama',
                        color: Colors.white,
                      ),
                    ),
                    color: Color.fromRGBO(23, 69, 145, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      side: BorderSide(
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
          /*decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3)
          ),*/
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
        ),
        new SignInFooter(),
      ],
    );
  }
  void _checkDetails() {
    print(this.isLoggedIn);
    widget.onLogin(!this.isLoggedIn);
    setState(() {
      this.isLoggedIn = !this.isLoggedIn;
    });
  }
}

