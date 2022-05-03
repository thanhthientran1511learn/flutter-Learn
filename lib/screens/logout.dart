import 'package:flutter/material.dart';
import 'package:project/screens/auth/login.dart';
import 'package:project/screens/home.dart';

import '../components/bottomnavigationbar.dart';
//screens

//. . .

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
//* Image
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: SizedBox(
            width: 200,
            height: 250,
            child: Image.asset(
              'assets/logout.webp',
            ),
          ),
        ),
//* Text
        const Padding(
          padding: EdgeInsets.fromLTRB(0,0,0,50),
          child: Text(
            'Are you sure logout?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w500,
                fontSize: 40),
          ),
        ),

//* Button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    onSurface: Colors.grey,
                    minimumSize: const Size(50, 40),
                    ),
                label: const Text('YES'),
                icon: const Icon(Icons.check),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                }),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                  minimumSize: const Size(50, 40)
                ),
                label: const Text('NO'),
                icon: const Icon(Icons.cancel_outlined),
                onPressed: () {
                  
                })
          ],
        )
      ],
    );
  }
}
