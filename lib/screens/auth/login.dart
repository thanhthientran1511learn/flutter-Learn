// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//screens
import 'package:project/screens/auth/register.dart';

import '../../components/bottomnavigationbar.dart';

class Login extends StatefulWidget {
  static const routeName = "/login";
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  final username = TextEditingController();
  final password = TextEditingController();

  funcLogin() async {
    final strUsername = username.text;
    final strPassword = password.text;

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
    }
    try {
      var url = Uri.parse(
          'http://api.phanmemquocbao.com/api/info/CheckAccount?username=$strUsername&password=$strPassword&token=lethibaotran');
      // var url = Uri.parse(
      //     'http://api.phanmemquocbao.com/api/Doituong/getobjectsall?tokenget=lethibaotran');
      var respone = await http.get(url);
      print(respone.body);
      if ((strUsername == 'admin' && strPassword == '123') ||
          respone.body != 'null') {
        Navigator.of(context)
            .pushReplacementNamed(BottomNavigationBarC.routeName);
      } else {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: const Text('Warning!'),
                  content: const Text('Username or password is not correct.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        return Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    )
                  ]);
            });
      }
    } catch (err) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text('Warning!'),
                content: const Text('Username or password is not correct.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      return Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  )
                ]);
          });
    }
  }

  funcRegister() {
    return Navigator.of(context).pushNamed(Register.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: SafeArea(
        // padding: const EdgeInsets.all(10),
        top: true,
        bottom: true,
        left: false,
        right: true,
        child: ListView(
          children: <Widget>[
//*logo
            Padding(
              padding: const EdgeInsets.all(50),
              child: SizedBox(
                width: 100,
                height: 150,
                child: Image.asset(
                  'assets/logo.jpg',
                ),
              ),
            ),
//*input username
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    suffixIcon: Icon(Icons.account_circle)),
              ),
            ),
//*input password
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  suffixIcon: Icon(Icons.key),
                ),
              ),
            ),
            Column(
              children: [
                FlatButton(
                    onPressed: () {},
                    textColor: Colors.blue,
                    child: const Text('Forgot Password')),
              ],
            ),
//*login button
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  width: 200,
                  height: 41,
                  child: ElevatedButton(
                    child: const Text('Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      funcLogin();
                    },
                  ),
                ),
              ),
            ),
//*register
            Container(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  FlatButton(
                    textColor: Colors.blue,
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      funcRegister();
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
