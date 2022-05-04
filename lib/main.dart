import 'package:flutter/material.dart';
import 'package:project/screens/auth/register.dart';
import 'package:project/screens/editStudent.dart';
//screens 
import 'components/bottomnavigationbar.dart';
import 'screens/splash-screen.dart';
import 'screens/auth/login.dart';

void main() {
  // runApp(const MyApp());
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Student Management App",
    home: Index(),
    // initialRoute: '/',
    routes: {
      BottomNavigationBarC.routeName: (ctx) => BottomNavigationBarC(),
      Login.routeName : (ctx) => const Login(),
      Register.routeName : (ctx) => const Register(),
      EditStudent.routeName : (ctx) => EditStudent(),
    },
  ));
}
