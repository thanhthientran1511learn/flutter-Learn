import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:project/screens/infor.dart';

//screens
import '../screens/dashboard.dart';
import '../screens/home.dart';
import '../screens/addStudent.dart';
import '../screens/logout.dart';
// . . .

class BottomNavigationBarC extends StatefulWidget {
  static const routeName = "bottom-navigation";
  @override
  _BottomNavigationBarCState createState() => _BottomNavigationBarCState();
}

class _BottomNavigationBarCState extends State<BottomNavigationBarC> {
  
  late int index;
  @override
  void initState() {
    super.initState();
    index = 0;
  }

  bodyWidget(int pos) {
    switch (pos) {
      case 0:
        return const Home();
      case 1:
        return const Dashboard();
      case 2:
        return const AddStudent();
      case 3:
        return Logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.home,
        size: 30,
      ),
      const Icon(Icons.dashboard, size: 30),
      const Icon(Icons.account_circle_sharp, size: 30),
      const Icon(Icons.logout, size: 30),
    ];
    return Scaffold(
      extendBody: true,
      // appBar: AppBar(
      //   elevation: 0,
      // ),
      // body: Center(
      //   child: Text(
      //     '${index+1}',
      //     style: const TextStyle(
      //       color: Colors.blueAccent,
      //       fontSize: 120,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blueAccent,
          backgroundColor: Colors.white,
          height: 60,
          index: index,
          items: items,
          onTap: (index) => {setState(() => this.index = index)}),
      body: bodyWidget(index),
    );
  }
}
