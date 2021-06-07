import 'dart:async';

import 'package:artlar/authblock/authblock.dart';
import 'package:artlar/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  StreamSubscription<User> loginStateSubcription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubcription = authBloc.currentUser.listen((fbuser) {
      if (fbuser != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen1(),
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
        onPressed: () => authBloc.loginGoogle(),
        icon: Icon(Icons.login),
        label: Text('entrar'),
      )),
    );
  }
}
