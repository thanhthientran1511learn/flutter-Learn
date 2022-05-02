import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const routeName = "/login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();

  funcLogin() {
    final strUsername = username.text.trim();
    final strPassword = password.text.trim();
    if (strUsername == '' || strPassword == '') {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text('Warning'),
                content: const Text('Please fill all information!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      return Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  )
                ]);
          });
    } else{
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Information'),
            content: Text('Username: $strUsername and Password: $strPassword'),
            actions: [
              TextButton(
                onPressed: () {
                  return Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ]
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              width: 100,
              height: 150,
              child: Text(
                'LOGIN INFORMATION',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  suffixIcon: Icon(Icons.account_circle)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
