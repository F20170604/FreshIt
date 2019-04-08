import 'dart:io';

import 'package:meta/meta.dart';

abstract class InputEvent {}

class FirstInput extends InputEvent {}

class SecondInput extends InputEvent {}

class ImageInputEvent extends InputEvent {
  final File image;
  ImageInputEvent({@required this.image});
}
