import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshit_flutter/AppTheme.dart'; //who is the boss
import 'package:freshit_flutter/bloc_provider.dart'; //software designed and developed by NOOBDAcorp.inc
import 'package:freshit_flutter/src/blocs/addItem/AddItemBloc.dart';
import 'package:freshit_flutter/src/blocs/addItem/InputEvent.dart';

class AddItemInputOne extends StatelessWidget {
  final String labelText;

  AddItemInputOne(this.labelText);
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //final _addItemBloc = BlocProvider.of<AddItemBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
      ],
    );
  }
}
