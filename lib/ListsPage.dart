import 'dart:convert' as json;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshit_flutter/AppTheme.dart';
import 'package:freshit_flutter/BottomNav.dart';
import 'package:freshit_flutter/HomePage.dart';
import 'package:freshit_flutter/SettingsPage.dart';
import 'package:freshit_flutter/bloc_provider.dart';
import 'package:freshit_flutter/item.dart';
import 'package:flutter/material.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationBloc.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationEvent.dart';
import 'package:freshit_flutter/src/blocs/home/HomeBloc.dart';
import 'package:freshit_flutter/src/blocs/home/HomeEvent.dart';
import 'package:freshit_flutter/src/blocs/home/HomeRepository.dart';
import 'package:freshit_flutter/src/blocs/home/HomeState.dart';

class ListsPageState extends StatefulWidget {
  final HomeRepository homeRepository;
  ListsPageState(this.homeRepository);

  @override
  State<StatefulWidget> createState() {
    return ListsPage();
  }
}

class ListsPage extends State<ListsPageState> {
  HomeBloc _homeBloc;
  @override
  void initState() {
    _homeBloc = HomeBloc(widget.homeRepository);
  }

  final String jsonString = json.jsonEncode({
    "items": {
      "1": {
        "name": "Watermelon",
        "imageUrl": "images/watermelon.jpg",
        "quantity": "1",
        "unit": "kilogram",
        "storedIn": "Referigerator",
        "tags": "Fruits",
        "expiryDate": "20190104",
        "isWasted": false
      },
      "2": {
        "name": "Bread",
        "imageUrl": "images/bread.jpg",
        "quantity": "12",
        "unit": "packets",
        "storedIn": "Referigerator",
        "tags": "Dairy",
        "expiryDate": "20190104",
        "isWasted": false
      },
      "3": {
        "name": "Milk",
        "imageUrl": "images/milk.jpg",
        "quantity": "1",
        "unit": "packet",
        "storedIn": "Referigerator",
        "tags": "Dairy",
        "expiryDate": "20190104",
        "isWasted": false
      },
      "4": {
        "name": "Spinach",
        "imageUrl": "images/spinach.jpg",
        "quantity": "1",
        "unit": "kg",
        "storedIn": "Referigerator",
        "tags": "Vegetables",
        "expiryDate": "20190104",
        "isWasted": false
      }
    }
  });

  // @override
  // Widget build(BuildContext context) {
  //   Size screenSize = MediaQuery.of(context).size;
  //   // remove from here and implement this inside bloc for ListsPage
  //   getJsonFromFile();
  //   return ListView(
  //     children: _items.map((Item i) => _buildItem(i, screenSize)).toList(),
  //   );
  // }

  // Widget build(BuildContext context) {
  //   Size screenSize = MediaQuery.of(context).size;
  //   getJsonFromFile();

  // }

  Widget _buildItem(DocumentSnapshot item, Size screenSize) {
    return new Card(
      margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: AspectRatio(
              aspectRatio: 0.75,
              child: Image.network(
                item['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
            width: 120,
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4),
                child: new Text(
                  item['name'],
                  softWrap: true,
                  style: new TextStyle(
                    fontSize: 20,
                    fontFamily: AppTheme.primaryFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    child: new Text(
                      '${item["quantity"]} ${item["unit"]}',
                      style: new TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
                    child: new Text(
                      item["storedIn"],
                      style: new TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              // TODO : color depending on tags
              Container(
                color: Color.fromRGBO(255, 82, 78, 1.0),
                child: Center(
                  child: Text(
                    item["tags"],
                  ),
                ),
                constraints: BoxConstraints.tight(Size(100, 30)),
                margin: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
              ),
              // Change Date format
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
                child: Text(
                  'Expires in: 2 days',
                  style: new TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
              Container(
                child: new RaisedButton(
                  onPressed: () => null,
                  color: AppTheme.primaryColor,
                  child: new Text(
                    'Used It',
                    style: TextStyle(
                        fontFamily: AppTheme.primaryFont,
                        fontSize: 21,
                        letterSpacing: 2,
                        color: Colors.white),
                  ),
                ),
                width: screenSize.width - 130,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return CustomBlocProvider(
      bloc: _homeBloc,
      child: new Scaffold(
        resizeToAvoidBottomPadding: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/addItem'),
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
                fontFamily: AppTheme.primaryFont,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
          ),
          backgroundColor: Color.fromRGBO(23, 69, 145, 1.0),
          actions: <Widget>[
            IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () => null,
            ),
            IconButton(
              icon: new Icon(
                Icons.sort,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () => BlocProvider.of<AuthenticationBloc>(context)
                  .dispatch(LoggedOut()),
            )
          ],
        ),
        body: StreamBuilder(
          stream: _homeBloc.selectedPage,
          initialData: HomePage(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text("Loading");
            return snapshot.data;
          },
        ),
        bottomNavigationBar: BottomNav(
          color: Colors.white,
          selectedColor: Colors.red,
          items: [
            BottomNavItem(Icons.home, 'Home'),
            BottomNavItem(Icons.delete, 'Waste'),
            BottomNavItem(Icons.notifications, 'Notifications'),
            BottomNavItem(Icons.settings, 'Settings'),
          ],
          backgroundColor: Colors.blue,
          onTabSelected: (int i) => _homeBloc.pageIndexSubject.add(i),
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   Size screenSize = MediaQuery.of(context).size;
  //   return ListView(
  //     children: <Widget>[
  //       new Card(
  //           margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
  //           child: new Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: <Widget>[
  //               Container(
  //                 child: AspectRatio(
  //                   aspectRatio: 0.75,
  //                   child: Image.asset(
  //                     'images/bread.jpg',
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 width: 120,
  //                 //margin: EdgeInsets.only(left:5.0),
  //               ),
  //               new Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4),
  //                     child: new Text(
  //                       "Bread",
  //                       softWrap: true,
  //                       style: new TextStyle(
  //                         fontSize: 20,
  //                         fontFamily: 'Flama',
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                   new Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: <Widget>[
  //                       Padding(
  //                         padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
  //                         child: new Text(
  //                           '1 packets',
  //                           style: new TextStyle(
  //                             fontSize: 16,
  //                           ),
  //                         ),
  //                       ),
  //                       //Spacer(),
  //                       Padding(
  //                         padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                         child: new Text(
  //                           'Referigerator',
  //                           style: new TextStyle(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.bold,
  //                             color: Color.fromRGBO(23, 69, 145, 1.0),
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   Container(
  //                     color: Colors.pink[100],
  //                     child: Center(
  //                       child: Text(
  //                         'Dairy',
  //                       ),
  //                     ),
  //                     constraints: BoxConstraints.tight(Size(100, 30)),
  //                     margin: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                     //alignment: Alignment.centerRight,
  //                     //margin: EdgeInsets.only(right: 120),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                     child: Text(
  //                       'Expires in: 2 days',
  //                       style: new TextStyle(
  //                           color: Colors.red,
  //                           fontSize: 18
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     child: new RaisedButton(
  //                       onPressed: ()=> null,
  //                       color: Color.fromRGBO(23, 69, 145, 1.0),
  //                       child: new Text(
  //                         'Used It',
  //                         style: TextStyle(
  //                             fontFamily: 'Flama',
  //                             fontSize: 21,
  //                             letterSpacing: 2,
  //                             color: Colors.white
  //                         ),
  //                       ),
  //                     ),
  //                     width: screenSize.width-130,
  //                   )
  //                 ],
  //               )
  //             ],
  //           )
  //       ),
  //       new Card(
  //           margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
  //           child: new Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: <Widget>[
  //               Container(
  //                 child: AspectRatio(
  //                   aspectRatio: 0.75,
  //                   child: Image.asset(
  //                     'images/spinach.jpg',
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 width: 120,
  //                 //margin: EdgeInsets.only(left:5.0),
  //               ),
  //               new Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4),
  //                     child: new Text(
  //                       "Spinach",
  //                       softWrap: true,
  //                       style: new TextStyle(
  //                         fontSize: 20,
  //                         fontFamily: 'Flama',
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                   new Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: <Widget>[
  //                       Padding(
  //                         padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
  //                         child: new Text(
  //                           '250 gms',
  //                           style: new TextStyle(
  //                             fontSize: 16,
  //                           ),
  //                         ),
  //                       ),
  //                       //Spacer(),
  //                       Padding(
  //                         padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                         child: new Text(
  //                           'Referigerator',
  //                           style: new TextStyle(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.bold,
  //                             color: Color.fromRGBO(23, 69, 145, 1.0),
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   Container(
  //                     color: Colors.green,
  //                     child: Center(
  //                       child: Text(
  //                         'Vegetables',
  //                       ),
  //                     ),
  //                     constraints: BoxConstraints.tight(Size(100, 30)),
  //                     margin: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                     //alignment: Alignment.centerRight,
  //                     //margin: EdgeInsets.only(right: 120),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                     child: Text(
  //                       'Expires in: 2 days',
  //                       style: new TextStyle(
  //                           color: Colors.red,
  //                           fontSize: 18
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     child: new RaisedButton(
  //                       onPressed: ()=> null,
  //                       color: Color.fromRGBO(23, 69, 145, 1.0),
  //                       child: new Text(
  //                         'Used It',
  //                         style: TextStyle(
  //                             fontFamily: 'Flama',
  //                             fontSize: 21,
  //                             letterSpacing: 2,
  //                             color: Colors.white
  //                         ),
  //                       ),
  //                     ),
  //                     width: screenSize.width-130,
  //                   )
  //                 ],
  //               )
  //             ],
  //           )
  //       ),
  //       new Card(
  //           margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
  //           child: new Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: <Widget>[
  //               Container(
  //                 child: AspectRatio(
  //                   aspectRatio: 0.75,
  //                   child: Image.asset(
  //                     'images/watermelon.jpg',
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 width: 120,
  //                 //margin: EdgeInsets.only(left:5.0),
  //               ),
  //               new Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4),
  //                     child: new Text(
  //                       "Watermelon",
  //                       softWrap: true,
  //                       style: new TextStyle(
  //                         fontSize: 20,
  //                         fontFamily: 'Flama',
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                   new Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: <Widget>[
  //                       Padding(
  //                         padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
  //                         child: new Text(
  //                           '1 piece',
  //                           style: new TextStyle(
  //                             fontSize: 16,
  //                           ),
  //                         ),
  //                       ),
  //                       //Spacer(),
  //                       Padding(
  //                         padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                         child: new Text(
  //                           'Referigerator',
  //                           style: new TextStyle(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.bold,
  //                             color: Color.fromRGBO(23, 69, 145, 1.0),
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   Container(
  //                     color: Color.fromRGBO(255, 82, 78, 1.0),
  //                     child: Center(
  //                       child: Text(
  //                         'Fruits',
  //                       ),
  //                     ),
  //                     constraints: BoxConstraints.tight(Size(100, 30)),
  //                     margin: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                     //alignment: Alignment.centerRight,
  //                     //margin: EdgeInsets.only(right: 120),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                     child: Text(
  //                       'Expires in: 2 days',
  //                       style: new TextStyle(
  //                           color: Colors.red,
  //                           fontSize: 18
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     child: new RaisedButton(
  //                       onPressed: ()=> null,
  //                       color: Color.fromRGBO(23, 69, 145, 1.0),
  //                       child: new Text(
  //                         'Used It',
  //                         style: TextStyle(
  //                             fontFamily: 'Flama',
  //                             fontSize: 21,
  //                             letterSpacing: 2,
  //                             color: Colors.white
  //                         ),
  //                       ),
  //                     ),
  //                     width: screenSize.width-130,
  //                   )
  //                 ],
  //               )
  //             ],
  //           )
  //       ),
  //       new Card(
  //           margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
  //           child: new Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: <Widget>[
  //               Container(
  //                 child: AspectRatio(
  //                   aspectRatio: 0.75,
  //                   child: Image.asset(
  //                     'images/milk.jpg',
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 width: 120,
  //                 //margin: EdgeInsets.only(left:5.0),
  //               ),
  //               new Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4),
  //                     child: new Text(
  //                       "Watermelon",
  //                       softWrap: true,
  //                       style: new TextStyle(
  //                         fontSize: 20,
  //                         fontFamily: 'Flama',
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                   new Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: <Widget>[
  //                       Padding(
  //                         padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
  //                         child: new Text(
  //                           '5 packets',
  //                           style: new TextStyle(
  //                             fontSize: 16,
  //                           ),
  //                         ),
  //                       ),
  //                       //Spacer(),
  //                       Padding(
  //                         padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                         child: new Text(
  //                           'Referigerator',
  //                           style: new TextStyle(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.bold,
  //                             color: Color.fromRGBO(23, 69, 145, 1.0),
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   Container(
  //                     color: Colors.pink[100],
  //                     child: Center(
  //                       child: Text(
  //                         'Dairy',
  //                       ),
  //                     ),
  //                     constraints: BoxConstraints.tight(Size(100, 30)),
  //                     margin: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                     //alignment: Alignment.centerRight,
  //                     //margin: EdgeInsets.only(right: 120),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
  //                     child: Text(
  //                       'Expires in: 2 days',
  //                       style: new TextStyle(
  //                           color: Colors.red,
  //                           fontSize: 18
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     child: new RaisedButton(
  //                       onPressed: ()=> null,
  //                       color: Color.fromRGBO(23, 69, 145, 1.0),
  //                       child: new Text(
  //                         'Used It',
  //                         style: TextStyle(
  //                             fontFamily: 'Flama',
  //                             fontSize: 21,
  //                             letterSpacing: 2,
  //                             color: Colors.white
  //                         ),
  //                       ),
  //                     ),
  //                     width: screenSize.width-130,
  //                   )
  //                 ],
  //               )
  //             ],
  //           )
  //       ),
  //     ],
  //   );
  // }

}
