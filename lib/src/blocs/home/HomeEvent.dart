import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class ItemUsed extends HomeEvent {
  final String itemId;
  ItemUsed(@required this.itemId);

  @override
  String toString() => 'Item Used Event';
}

class Test extends HomeEvent {
  @override
  String toString() => 'Test';
}
