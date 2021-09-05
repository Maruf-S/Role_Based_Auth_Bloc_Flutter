import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/login_bloc/login_bloc.dart';
import 'package:my_app/bloc/login_bloc/login_event.dart';
import 'package:my_app/bloc/login_bloc/login_state.dart';
import 'package:my_app/repositories/repositories.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  _LoginFormState();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          email: emailController.text, password: passwordController.text));
    }

    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFaliure) {
        print("&&&&&&&& LOGIN FALIURE  &&&&&&&&&");
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: "E-mail"),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Pswd"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: state is LoginLoading
                    ? Text("LOGIN LOADING")
                    : ElevatedButton(
                        onPressed: () {
                          _onLoginButtonPressed();
                        },
                        child: Text("LOGIN"),
                      ))
          ],
        ),
      );
    }));
  }
}
