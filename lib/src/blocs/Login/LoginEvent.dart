import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonClicked extends LoginEvent {
  final String username;
  final String password;

  LoginButtonClicked({@required this.username, @required this.password})
      : super([username, password]);

  @override
  String toString() => 'LoginButtonClicked';
}

class ResetLoginState extends LoginEvent {
  @override
  String toString() => 'ResetLoginState';
}
