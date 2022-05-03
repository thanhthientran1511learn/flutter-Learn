// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
//screens
import 'package:project/screens/auth/login.dart';

// ignore: must_be_immutable
class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  State<StatefulWidget> createState() => _IndexState();
  var navigatLogin = _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
    startRedirectLogin();
  }

  startRedirectLogin() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
    // Navigator.pushReplacementNamed(context, BottomNavigationBarC.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.jpg'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0B5EA7),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            // const CircularProgressIndicator(
            const SizedBox(
                width: 140,
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0B5EA7)),
                )),
          ],
        ),
      ),
    );
  }
}
