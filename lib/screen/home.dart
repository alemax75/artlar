import 'dart:async';

import 'package:artlar/authblock/authblock.dart';
import 'package:artlar/screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen1 extends StatefulWidget {
  HomeScreen1({Key key}) : super(key: key);

  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  StreamSubscription<User> loginStateSubcription;
  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubcription = authBloc.currentUser.listen((fbuser) {
      if (fbuser == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    loginStateSubcription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: Container(
        child: ElevatedButton.icon(
            onPressed: () => authBloc.logout(),
            icon: Icon(Icons.logout),
            label: Text('salir')),
      ),
    );
  }
}
