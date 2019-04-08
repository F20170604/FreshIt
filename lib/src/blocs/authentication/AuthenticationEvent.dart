import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() {
    return "AppStartedEvent";
  }
}

class LoggedIn extends AuthenticationEvent {
  final FirebaseUser user;
  LoggedIn({@required this.user}) {
    assert(user != null);
  }
  @override
  String toString() {
    return "LoggedInEvent";
  }
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() {
    return "LoggedOutEvent";
  }
}
