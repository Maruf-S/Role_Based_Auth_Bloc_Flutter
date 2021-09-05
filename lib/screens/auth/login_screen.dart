import 'package:flutter/material.dart';
import 'package:my_app/bloc/auth_bloc/auth.dart';
import 'package:my_app/bloc/login_bloc/login_bloc.dart';
import 'package:my_app/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/screens/auth/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return (LoginBloc(authBloc: BlocProvider.of<AuthBloc>(context)));
        },
        child: LoginForm(),
      ),
    );
  }
}
