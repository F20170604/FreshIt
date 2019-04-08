import 'package:bloc/bloc.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationEvent.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationState.dart';
import 'package:freshit_flutter/userRepository/userRepository.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc(@required this.userRepository);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = false;
      if (hasToken)
        yield AuthenticationAuthenticated();
      else
        yield AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationUnauthenticated();
    }
  }
}
