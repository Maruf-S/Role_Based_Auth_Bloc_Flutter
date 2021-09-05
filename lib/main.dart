import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/repositories/repositories.dart';
import 'package:my_app/screens/auth/intro_screen.dart';
import 'package:my_app/screens/main_screen/main_screen.dart';

import 'bloc/auth_bloc/auth.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

void main() async {
  Bloc.observer = MyBlocObserver();

  runApp(RepositoryProvider(
    create: (context) => UserRepositories(),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return AuthBloc()..add(AppStarted());
        })
      ],
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return MainScreen();
          }
          if (state is AuthUnauthenticated) {
            return Intro();
          }
          if (state is AuthLoading) {
            return Scaffold(body: CircularProgressIndicator());
          }
          return Scaffold(body: CircularProgressIndicator());
        },
      ),
    );
  }
}
