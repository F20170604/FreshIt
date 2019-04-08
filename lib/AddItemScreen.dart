import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshit_flutter/AddItemInputField.dart';
import 'package:freshit_flutter/AddItemInputOne.dart';
import 'package:freshit_flutter/AppTheme.dart';
import 'package:freshit_flutter/bloc_provider.dart';
import 'package:freshit_flutter/src/blocs/addItem/AddItemBloc.dart';
import 'package:freshit_flutter/src/blocs/addItem/InputEvent.dart';
import 'package:freshit_flutter/src/blocs/addItem/OutputState.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class AddItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AddItemState();
}

class AddItemState extends State<AddItem> {
  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  InputType inputType = InputType.both;
  final _addItemBloc = AddItemBloc();
  File _image;
  final _productController = new TextEditingController();
  final _quantityController = new TextEditingController();
  DateTime expiryDate;
  final _notifyPeriodController = new TextEditingController();
  String _unitsValue = "packets";
  String _storedInValue = "Referigerator";
  String _notifyTimeUnitValue = "days";
  List<DropdownMenuItem<String>> opt = [];
  GlobalKey<FormState> _key = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final _addItemBloc = AddItemBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text('FreshIt'),
        backgroundColor: AppTheme.primaryColor,
      ),
      resizeToAvoidBottomPadding: true,
      body: ListView(
        children: <Widget>[
          FlatButton(
            child: Icon(Icons.add_a_photo),
            onPressed: getImage,
          ),
          // Image.file(_image),
          // Container(
          //   margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          //   child: new Form(
          //     key: this._key,
          //     child: new Column(
          //       children: <Widget>[
          //         new TextFormField(
          //           keyboardType: TextInputType.text,
          //           decoration: InputDecoration(
          //             labelText: 'Product Name',
          //           ),
          //         ),
          //         new Row(
          //           children: <Widget>[
          //             Container(
          //               width: 100,
          //               child: new TextFormField(
          //                 keyboardType: TextInputType.numberWithOptions(),
          //                 decoration: InputDecoration(
          //                   labelText: 'Quantity',
          //                 ),
          //               ),
          //             ),
          //             SizedBox(
          //               width: 20,
          //             ),
          //             Expanded(
          //               child: new DropdownButtonFormField(
          //                 value: 'packets',
          //                 items: opt,
          //                 onChanged: (val) => print(val),
          //                 decoration: InputDecoration(
          //                   labelText: 'Units',
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //         new TextFormField(
          //           keyboardType: TextInputType.datetime,
          //           decoration: InputDecoration(
          //             labelText: 'Expiry Date',
          //           ),
          //         ),
          //         new Row(
          //           children: <Widget>[
          //             Expanded(
          //               child: new DropdownButtonFormField(
          //                 value: 'packets',
          //                 items: opt,
          //                 onChanged: (val) => print(val),
          //                 decoration: InputDecoration(
          //                     labelText: 'Stored In',
          //                     labelStyle: TextStyle(
          //                       fontSize: 20,
          //                     )),
          //               ),
          //             )
          //           ],
          //         ),
          //         new Text("Hello"),
          //       ],
          //     ),
          //   ),
          // )
          (_image != null)
              ? showImageWithDetails(MediaQuery.of(context).size)
              : Center(
                  child: Text(
                  "No image Uploaded",
                  style: TextStyle(
                    fontFamily: AppTheme.primaryFont,
                    fontSize: 28,
                    fontWeight: FontWeight.w100,
                  ),
                )),
        ],
      ),
    );
  }

  Widget showImageWithDetails(Size screenSize) {
    List<DropdownMenuItem<String>> unitsOptions = [];
    List<DropdownMenuItem<String>> storedInOptions = [];
    List<DropdownMenuItem<String>> notifyOptions = [];

    unitsOptions.add(DropdownMenuItem(
      value: 'packets',
      child: new Text('packets'),
    ));

    unitsOptions.add(DropdownMenuItem(
      value: 'kilograms',
      child: new Text('kilograms'),
    ));

    storedInOptions.add(DropdownMenuItem(
      value: 'Referigerator',
      child: new Text('Referigerator'),
    ));

    notifyOptions.add(DropdownMenuItem(
      value: 'days',
      child: new Text('days'),
    ));

    notifyOptions.add(DropdownMenuItem(
      value: 'hours',
      child: new Text('hours'),
    ));

    notifyOptions.add(DropdownMenuItem(
      value: 'minutes',
      child: new Text('minutes'),
    ));

    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: new Form(
        key: this._key,
        autovalidate: true,
        child: new Column(
          children: <Widget>[
            Container(
              child: Image.file(_image),
            ),
            new TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Product Name',
              ),
              controller: _productController,
              validator: (value) {
                if (value.isEmpty) return "Please Enter Text";
              },
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
                      controller: _quantityController,
                      validator: (value) {
                        if (value.isEmpty) return "Please Enter Text";
                      }),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: new DropdownButtonFormField(
                    value: _unitsValue,
                    items: unitsOptions,
                    onChanged: (val) => _unitsValue = val,
                    decoration: InputDecoration(
                      labelText: 'Units',
                    ),
                  ),
                )
              ],
            ),
            // new TextFormField(
            //     keyboardType: TextInputType.datetime,
            //     decoration: InputDecoration(
            //       labelText: 'Expiry Date',
            //     ),
            //     controller: _expiryDateController,
            //     validator: (value) {
            //       if (value.isEmpty) return "Please Enter Text";
            //     }),
            DateTimePickerFormField(
              inputType: inputType,
              format: formats[inputType],
              editable: false,
              decoration: InputDecoration(labelText: 'Expiry Date'),
              validator: (val) {
                if (val == null) return "Please Enter";
              },
              onChanged: (date) => expiryDate = date,
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new DropdownButtonFormField(
                    value: _storedInValue,
                    items: storedInOptions,
                    onChanged: (val) => _storedInValue = val,
                    decoration: InputDecoration(
                        labelText: 'Stored In',
                        labelStyle: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                Container(
                  width: 100,
                  child: new TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        labelText: 'Notify Before',
                      ),
                      controller: _notifyPeriodController,
                      validator: (value) {
                        if (value.isEmpty) return "Please Enter Text";
                      }),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: new DropdownButtonFormField(
                    value: _notifyTimeUnitValue,
                    items: notifyOptions,
                    onChanged: (val) => _notifyTimeUnitValue = val,
                    decoration: InputDecoration(),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: screenSize.width,
                child: new RaisedButton(
                  onPressed: () {
                    if (_key.currentState.validate()) submitForm();
                  }, //_checkDetails(),
                  padding: EdgeInsets.all(8),
                  child: new Text(
                    "Upload Item",
                    style: new TextStyle(
                      fontSize: 22,
                      fontFamily: AppTheme.primaryFont,
                      color: Colors.white,
                    ),
                  ),
                  color: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      side: BorderSide()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    // print("mg");
    setState(() {
      _image = image;
    });
    //_addItemBloc.imageStreamSink.add(image);
  }

  @override
  void dispose() {
    _productController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void submitForm() async {
    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child(_image.path);
    final StorageUploadTask uploadTask = await storageReference.putFile(_image);
    final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
    String imageUrl = await downloadUrl.ref.getDownloadURL();
    print(downloadUrl.ref.getDownloadURL());
    DocumentReference d = await Firestore.instance
        .collection("Users")
        .document("mayank.harsani@gmail.com")
        .collection("StoredItems")
        .add({
      'name': _productController.text,
      'imageUrl': imageUrl,
      'expiryDate': expiryDate,
      'storedIn': _storedInValue,
      'unit': _unitsValue,
      'quantity': int.parse(_quantityController.text),
      'tags': 'testTag',
      'notifyPeriod': _notifyPeriodController.text,
      'timeUnit': _notifyTimeUnitValue
    });
    //print(DateTime.par_expiryDateController.text);
    Navigator.of(context).pop();
  }

  DateTime getDate(String text) {
    List<String> i = text.split("/");
    return DateTime(int.parse(i[0]), int.parse(i[1]), int.parse(i[2]));
  }
}
