import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/auth_bloc/auth.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/repositories/repositories.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<User> user = Future<User>.delayed(const Duration(seconds: 0),
      () => RepositoryProvider.of<UserRepositories>(context).getCurrentUser());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LoggedOut());
              },
            ),
          ),
        ),
        backgroundColor: Colors.pink,
        body: Center(
          child: FutureBuilder(
            future: user,
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.role!);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
