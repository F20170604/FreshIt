import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super(props);
}

class Loading extends HomeState {
  @override
  String toString() => 'Home State Loading';
}

class Initial extends HomeState {
  String result;
  Initial({@required this.result}) {
    assert(result != null);
  }

  @override
  String toString() => 'Initial Home State';
}

class Final extends HomeState {
  String result;
  Final({@required this.result});

  @override
  String toString() => 'Final Home State';
}
