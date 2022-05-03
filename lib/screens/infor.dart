// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Infor extends StatefulWidget {
  const Infor({Key? key}) : super(key: key);
  @override
  State<Infor> createState() => _InforState();
}

class _InforState extends State<Infor> {
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final email = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // late DBHelper dbHelper;
  // late List<Student> listStudent;

  @override
  void initState() {
    super.initState();
  }

  funcSave() async {}

//* view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: const Text('Information Student'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
//* logo
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
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: const Text(
                'USER INFORMATION',
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
                controller: userName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'UserName'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: firstName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Fullname'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Phone'),
              ),
            ),
//* button
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: SizedBox(
                  width: 200,
                  height: 41,
                  child: ElevatedButton(
                    child: const Text('Save',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      funcSave();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
