import 'package:flutter/material.dart';
import 'title.dart';
import '_LoginPageState.dart';
import '_SignInFooter.dart';
import 'ListsPage.dart';
import 'BottomNav.dart';
import 'NotificationsPage.dart';
import 'SettingsPage.dart';
import 'WastePage.dart';
import 'AddItemScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Widget _selectedPage = ListsPage();
  GlobalKey<NavigatorState> _key = new GlobalKey(debugLabel: 'key');
  bool _loggedIn = false;

  @override
  Widget build(BuildContext context) {
    if (_loggedIn) {
      return new MaterialApp(
        title: 'FreshIt',
        home: Builder(
          builder: (context) => new Scaffold(
            resizeToAvoidBottomPadding: false,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed:()=> Navigator.of(context).pushNamed('/addItem'),
              tooltip: 'Add Item',
              child: Icon(Icons.add),
              elevation: 2.0,
              backgroundColor: Color.fromRGBO(238, 238, 238, 1.0),
              foregroundColor: Colors.black,
            ),
            appBar: new AppBar(
              title: new Text(
                "FreshIt",
                style: new TextStyle(
                    fontFamily: 'Flama',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal
                ),
              ),
              backgroundColor: Color.fromRGBO(23, 69, 145, 1.0),
              actions: <Widget>[
                IconButton(icon: new Icon(Icons.search, color: Colors.white, size: 32,), onPressed: ()=>null,),
                IconButton(icon: new Icon(Icons.sort, color: Colors.white, size: 32,),onPressed: ()=>null,)
              ],
            ),
            body: _selectedPage,
            bottomNavigationBar: BottomNav(
              color: Colors.white,
              selectedColor: Colors.red,
              items:[
                BottomNavItem(Icons.home, 'Home'),
                BottomNavItem(Icons.delete, 'Waste'),
                BottomNavItem(Icons.notifications, 'Notifications'),
                BottomNavItem(Icons.settings, 'Settings'),
              ],
              backgroundColor: Colors.blue,
              onTabSelected: _selectedTab,
            ),
          ),
        ),
        routes: <String, WidgetBuilder> {
          '/addItem': (BuildContext context) => new AddItem(),
        },
      );
    }
    return new MaterialApp(
      title: 'FreshIt',
      home: Builder(
        builder: (context) => new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: LoginPage(_updateLogin),
        ),
      ),
    );
  }

  Widget _getPageWithIndex(index) {
    switch(index) {
      case 0:
        return ListsPage();
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
      _selectedPage = _getPageWithIndex(index);
    });
  }

  void _updateLogin(val) {
    setState(() {
      this._loggedIn = val;
    });
  }
}