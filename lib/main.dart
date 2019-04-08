import 'package:flutter/material.dart';
import 'package:freshit_flutter/AppTheme.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationBloc.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationEvent.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshit_flutter/src/blocs/home/HomeRepository.dart';
import 'package:freshit_flutter/src/models/User.dart';
import 'package:freshit_flutter/userRepository/userRepository.dart';
import 'title.dart';
import '_LoginPageState.dart';
import '_SignInFooter.dart';
import 'ListsPage.dart';
import 'BottomNav.dart';
import 'NotificationsPage.dart';
import 'SettingsPage.dart';
import 'WastePage.dart';
import 'AddItemScreen.dart';

void main() {
  runApp(MyApp(userRepository: UserRepository()));
}

class MyApp extends StatefulWidget {
  final UserRepository userRepository;
  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //Widget _selectedPage = ListsPage();
  GlobalKey<NavigatorState> _key = new GlobalKey(debugLabel: 'key');

  AuthenticationBloc _authenticationBloc;
  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(_userRepository);
    _authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authenticationBloc,
      child: new MaterialApp(
        title: 'FreshIt',
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationAuthenticated) {
              return ListsPageState(HomeRepository(user: state.user));
            } else if (state is AuthenticationUnauthenticated ||
                state is AuthenticationUninitialized)
              return LoginPage(
                userRepository: _userRepository,
              );
          },
        ),
        routes: <String, WidgetBuilder>{
          '/addItem': (context) => new AddItem(),
        },
      ),
    );
  }

  Widget _getPageWithIndex(index) {
    switch (index) {
      case 0:
      //return ListsPage();
      case 1:
        return WastePage();
      case 2:
        return NotificationsPage();
      case 3:
        return SettingsPage();
    }
  }

  void _selectedTab(index) {
    print(index);
    setState(() {
      //_selectedPage = _getPageWithIndex(index);
    });
  }

  void _updateLogin(val) {
    setState(() {});
  }
}
