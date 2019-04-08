import 'dart:io';

import 'package:meta/meta.dart';

abstract class OutputState {}

class OutputOne extends OutputState {}

class OutputTwo extends OutputState {}

class ImageSelected extends OutputState {
  final File image;
  ImageSelected({@required this.image});
}
