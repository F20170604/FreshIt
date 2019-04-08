import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationEvent.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationState.dart';
import 'package:freshit_flutter/src/models/User.dart';
import 'package:freshit_flutter/userRepository/userRepository.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc(this.userRepository);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();
      print(hasToken);
      print("Appstarted");
      if (hasToken) {
        FirebaseUser user = await userRepository.getUserWithToken();
        yield AuthenticationAuthenticated(user: user);
      } else
        yield AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      yield AuthenticationAuthenticated(user: event.user);
    }

    if (event is LoggedOut) {
      userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
//import 'dart:async';

//import 'package:freshit_flutter/bloc_provider.dart';
// import 'package:freshit_flutter/src/blocs/authentication/AuthenticationState.dart';
//
// class AuthenticationBloc implements BlocBase {
//   StreamController<AuthenticationState> authenticationController =
//       StreamController<AuthenticationState>();
//       AuthenticationBloc() {
//         authenticationController.stream.listen((onData) {

//         });
//       }

//   @override
//   void dispose() {}
// }
