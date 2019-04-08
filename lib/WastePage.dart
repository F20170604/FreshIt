import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WastePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Text("Click the image of the product"),
        FlatButton(
          child: Icon(Icons.add_a_photo),
          onPressed: getImage,
        )
      ],
    ));
  }

  Future getImage() async {
    print("camer");
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //_addItemBloc.dispatch(ImageInputEvent(image: image));
  }
}
