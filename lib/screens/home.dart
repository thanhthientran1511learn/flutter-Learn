import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home', style: TextStyle(fontSize: 24),),
    );
  }
}