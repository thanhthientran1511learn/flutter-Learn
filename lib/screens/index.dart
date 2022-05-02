import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//screens
import 'package:project/screens/login.dart';

class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  State<StatefulWidget> createState() => _IndexState();
  var navigatLogin = _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState(){
    super.initState();
    startRedirectLogin();
  }
  startRedirectLogin() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }
  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.jpg'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Text('Welcome . . .',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
            const Padding(padding: EdgeInsets.only(top:20)),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 2,
            )
            
          ],
        ),
      ),
    );
  }

}
