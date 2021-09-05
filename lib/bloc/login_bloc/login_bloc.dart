import 'package:bloc/bloc.dart';
import 'package:my_app/bloc/auth_bloc/auth.dart';
import 'package:my_app/bloc/login_bloc/login_event.dart';
import 'package:my_app/bloc/login_bloc/login_state.dart';
import 'package:my_app/repositories/repositories.dart';
import 'dart:async';
import 'dart:convert';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepositories userRepositories = UserRepositories();

  final AuthBloc authBloc;
  LoginBloc({required this.authBloc}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        print(event.email);
        final user = await userRepositories.login(event.email, event.password);
        // //! HERE
        print(user["status"]);
        if (user["status"] != "200") {
          yield LoginFaliure(error: (user["message"]));
        } else {
          authBloc.add(LoggedIn(user: user["body"]));
        }
      } catch (error) {
        print(error);
        yield LoginFaliure(error: "Invalid Credentials!");
      } finally {
        yield LoginInitial();
      }
    }
  }
}
