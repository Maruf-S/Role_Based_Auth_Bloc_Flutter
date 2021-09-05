import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/repositories/repositories.dart';
import 'package:my_app/screens/auth/login_screen.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  _IntroState();
  var clicked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            clicked = true;
          });
        },
        child: clicked
            ? LoginScreen()
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
