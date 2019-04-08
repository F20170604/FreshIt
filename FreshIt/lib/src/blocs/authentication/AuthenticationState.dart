import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const[]]): super(props);
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationUninitialized";
  }
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationInitialized";
  }
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationLoading";
  }
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationUnauthenticated";
  }
}