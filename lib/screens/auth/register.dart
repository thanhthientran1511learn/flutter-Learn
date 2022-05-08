// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//screens
import 'package:project/screens/auth/login.dart';

class Register extends StatefulWidget {
  static const routeName = "/register";
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
  }

  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final email = TextEditingController();
  final confirmpassword = TextEditingController();
  bool checkedValue = true;

  funcRegister() async {
    final strUserName = userName.text.trim();
    final strPassword = password.text.trim();
    final strfirstName = firstName.text.trim();
    final strEmail = email.text.trim();

    dialogMissingInfor() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Warning'),
              content: const Text('Please fill all information.'),
              actions: [
                TextButton(
                  onPressed: () {
                    return Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    }

    //check null value
    if (strUserName == '' ||
        strPassword == '' ||
        strfirstName == '' ||
        strEmail == '') {
      dialogMissingInfor();
    } else {
      try {     
      //api
      var url = Uri.parse(
          'http://api.phanmemquocbao.com/api/info/InsertAccount?username=$strUserName&fullname=$strfirstName&email=$strEmail&password=$strPassword&token=lethibaotran');
      var response = await http.get(url);
      if (response.body != 'null') {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Info'),
                content: const Text('Register successfull.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      return Navigator.pop(
                          context, ModalRoute.withName(Login.routeName));
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      }   
      } catch (err) {
        dialogMissingInfor();
      }
    }
  }

  funcLogin() {
    // Navigator.of(context).pushReplacementNamed(Login.routeName);
    Navigator.pop(context, ModalRoute.withName(Login.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Register'),
      // ),
      body: SafeArea(
        // padding: const EdgeInsets.all(10),
        top: true,
        bottom: true,
        left: false,
        right: true,
        child: ListView(
          // ignore: duplicate_ignore
          children: <Widget>[
//*logo
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: SizedBox(
                width: 60,
                height: 90,
                child: Image.asset(
                  'assets/logo.jpg',
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: const Text(
                'REGISTER',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
//* input fulName & Email
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                        controller: firstName,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                            labelText: 'Full name')),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                        controller: email,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                            labelText: 'Email')),
                  ),
                ],
              ),
            ),
//* input username
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: userName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'User Name'),
              ),
            ),
//* input password
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
            ),
//* input confirmpassword
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: confirmpassword,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password'),
              ),
            ),
            // ignore: deprecated_member_use
//* Terms of Use & Privacy Policy
            Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: CheckboxListTile(
                  title:
                      const Text("I accept the Terms of Use & Privacy Policy"),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                )),
//* Register button
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: 200,
                  height: 41,
                  child: ElevatedButton(
                    child: const Text('Register now',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      funcRegister();
                    },
                  ),
                ),
              ),
            ),
//* login
            Container(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                children: <Widget>[
                  const Text('Does have account?'),
                  FlatButton(
                    textColor: Colors.blue,
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      funcLogin();
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
