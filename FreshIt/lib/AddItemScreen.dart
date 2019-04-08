import 'package:flutter/material.dart';
import 'package:freshit_flutter/AppTheme.dart';

class AddItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddItemScreen();
  }
}

class AddItemScreen extends State<AddItem> {
  GlobalKey<FormState> _key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> opt = [];
    opt.add(
      DropdownMenuItem(
        value: 'packets',
        child: new Text('packets'),
      )
    );
    opt.add(
        DropdownMenuItem(
          value: 'kgs',
          child: new Text('kilograms'),
        )
    );

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text(
          "FreshIt",
          style: new TextStyle(
              fontFamily: AppTheme.primaryFont,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body:Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: new AspectRatio(
              aspectRatio: 1,
              child: Image.asset('images/watermelon.jpg', fit: BoxFit.cover,),
            ),
            margin: EdgeInsets.all(10),
            width: 300,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10,20,0),
            child: new Form(
              key: this._key,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: new TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                            labelText: 'Quantity',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: new DropdownButtonFormField(
                          value: 'packets',
                          items: opt,
                          onChanged: (val)=>print(val),
                          decoration: InputDecoration(
                            labelText: 'Units',
                          ),
                        ),
                      )
                    ],
                  ),
                  new TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      Expanded(
                        child: new DropdownButtonFormField(
                          value: 'packets',
                          items: opt,
                          onChanged: (val)=>print(val),
                          decoration: InputDecoration(
                              labelText: 'Stored In',
                              labelStyle: TextStyle(
                                fontSize: 20,
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

}