import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshit_flutter/src/blocs/Login/LoginEvent.dart';
import 'package:freshit_flutter/src/blocs/Login/LoginState.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationBloc.dart';
import 'package:freshit_flutter/src/blocs/authentication/AuthenticationEvent.dart';
import 'package:freshit_flutter/userRepository/userRepository.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({this.userRepository, this.authenticationBloc}) {
    assert(userRepository != null);
    assert(authenticationBloc != null);
  }

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonClicked) {
      //yield LoginLoading();
      try {
        final FirebaseUser user =
            await userRepository.signInWithEmailAndPassword(
          username: event.username,
          password: event.password,
        );
        authenticationBloc.dispatch(LoggedIn(user: user));
        yield LoginInitial();
      } catch (error) {
        print(error.toString());
        yield LoginFailure(error: error.toString());
      }
    } else if (event is ResetLoginState) {
      yield LoginInitial();
    }
  }
}
