import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  static const routeName = '/me';
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              // SizedBox(
              //   width: 100,
              //   height: 150,
              //   child: Image.asset(
              //     'assets/logoqb.jpg',
              //   ),
              // ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: const Text(
                  'Thông tin sinh viên',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                child: const Text(
                  'Trần Thiện Thanh - 18DH110724',
                  style: TextStyle(
                    color: Color.fromARGB(255, 57, 33, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(0),
                child: const Text(
                  'PM1801',
                  style: TextStyle(
                    color: Color.fromARGB(255, 57, 33, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
