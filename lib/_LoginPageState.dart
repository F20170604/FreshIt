import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshit_flutter/AppTheme.dart';
import 'package:freshit_flutter/src/blocs/Login/LoginBloc.dart';
import 'package:freshit_flutter/src/blocs/Login/LoginEvent.dart';
import 'package:freshit_flutter/src/blocs/Login/LoginState.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationBloc.dart';
import 'package:freshit_flutter/userRepository/userRepository.dart';
import 'title.dart';
import '_SignInFooter.dart';
import 'package:flutter/scheduler.dart';

class LoginPage extends StatefulWidget {
  final ValueChanged<bool> onLogin;
  final UserRepository userRepository;

  LoginPage({this.onLogin, @required this.userRepository});

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
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;
  UserRepository get _userRepository => widget.userRepository;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
        userRepository: _userRepository,
        authenticationBloc: _authenticationBloc);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState state) {
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: BlocBuilder<LoginEvent, LoginState>(
              bloc: _loginBloc,
              builder: (BuildContext context, LoginState state) {
                if (state is LoginFailure) {
                  _onWidgetDidBuild(() {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${state.error}'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  });
                  _loginBloc.dispatch(ResetLoginState());
                }
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
                              controller: _emailController,
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
                              controller: _passwordController,
                            ),
                            new Container(
                              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              width: screenSize.width,
                              child: new RaisedButton(
                                onPressed: () => _checkDetails(),
                                padding: EdgeInsets.all(10),
                                child: new Text(
                                  "SignIn",
                                  style: new TextStyle(
                                    fontSize: 28,
                                    fontFamily: AppTheme.primaryFont,
                                    color: Colors.white,
                                  ),
                                ),
                                color: AppTheme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    side: BorderSide()),
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
              }),
        );
      },
    );
  }

  void _checkDetails() {
    _loginBloc.dispatch(LoginButtonClicked(
        username: _emailController.text, password: _passwordController.text));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onWidgetDidBuild(Function callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
