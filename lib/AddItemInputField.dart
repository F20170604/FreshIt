import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshit_flutter/AppTheme.dart'; //who is the boss
import 'package:freshit_flutter/bloc_provider.dart'; //software designed and developed by NOOBDAcorp.inc
import 'package:freshit_flutter/src/blocs/addItem/AddItemBloc.dart';
import 'package:freshit_flutter/src/blocs/addItem/InputEvent.dart';

class AddItemInputField extends StatelessWidget {
  final String labelText;
  AddItemInputField(this.labelText);

  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(labelText);
    //final _addItemBloc = BlocProvider.of<AddItemBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: labelText,
            ),
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: AppTheme.primaryFont,
            ),
            controller: _textController,
          ),
        )),
        new Container(
          //margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          padding: EdgeInsets.all(20),
          width: 200,
          child: new RaisedButton(
            elevation: 20.0,
            onPressed: () {
              //print(labelText);
              //_addItemBloc.dispatch(new FirstInput("0"));
            },
            padding: EdgeInsets.all(10.0),
            child: new Text(
              "Next",
              style: new TextStyle(
                fontSize: 20,
                fontFamily: AppTheme.primaryFont,
                color: Colors.white,
              ),
            ),
            color: AppTheme.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                side: BorderSide(color: Colors.white)),
          ),
        )
      ],
    );
  }
}
