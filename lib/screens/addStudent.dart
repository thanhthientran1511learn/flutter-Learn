// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);
  @override
  State<AddStudent> createState() => _InforState();
}

class _InforState extends State<AddStudent> {
  final lastName = TextEditingController(text: "");
  final firstName = TextEditingController(text: "");
  final address = TextEditingController(text: "");
  final course = TextEditingController(text: "");
  final phone = TextEditingController(text: "");
  final mail = TextEditingController(text: "");
  final status = TextEditingController(text: "");
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // late DBHelper dbHelper;
  // late List<Student> listStudent;

  @override
  void initState() {
    super.initState();
  }

  //cleanInput
  cleanText() {
    firstName.clear();
    lastName.clear();
    address.clear();
    course.clear();
    phone.clear();
    mail.clear();
    status.clear();
  }

  funcSave() async {
    //fields
    final strFirstName = firstName.text;
    final strLastName = lastName.text;
    final strAddress = address.text;
    final strCourse = course.text;
    final strPhone = phone.text;
    final strMail = mail.text;
    final strStatus = status.text;

    if (strFirstName != '' &&
        strLastName != '' &&
        strAddress != '' &&
        strCourse != '' &&
        strStatus != '') {
      var url;
      if (strPhone != '' || strMail != '') {
        url = Uri.parse(
            'http://api.phanmemquocbao.com/api/Doituong/InsertObjects?p0=$strLastName&p1=$strFirstName&p2=$strAddress&p3=$strCourse&p4=$strPhone&p5=$strMail&p6=$strStatus&tokenin=lethibaotran');
      } else {
        url = Uri.parse(
            'http://api.phanmemquocbao.com/api/Doituong/InsertObjects?p0=$strLastName&p1=$strFirstName&p2=$strAddress&p3=$strCourse&p4=${''}&p5=${''}&p6=$strStatus&tokenin=lethibaotran');
      }
      // var response = await http.get(url);
      await http.get(url);
      cleanText();
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Th??ng b??o'),
              content: const Text('Th??m sinh vi??n th??nh c??ng!'),
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
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Th??ng b??o'),
              content: const Text('Ch??a nh???p ?????y ????? th??ng tin.'),
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
  }

//* view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: const Text('Information Student'),
      // ),
      body: SafeArea(
        // padding: const EdgeInsets.all(10),
        top: true,
        bottom: true,
        left: false,
        right: true,
        child: ListView(
          children: <Widget>[
// // * logo
//             Padding(
            //   padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            //   child: SizedBox(
            //     width: 60,
            //     height: 90,
            //     child: Image.asset(
            //       'assets/logo.jpg',
            //     ),
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: const Text(
                'Th??m th??ng tin sinh vi??n',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                        controller: lastName,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                            labelText: 'H???*')),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                        controller: firstName,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                            labelText: 'T??n*')),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: address,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: '?????a ch???*'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: course,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'MSSV* '),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'S??T'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: mail,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Mail'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: status,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'T??nh tr???ng*'),
              ),
            ),

//* button
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
                child: SizedBox(
                  width: 200,
                  height: 41,
                  child: ElevatedButton(
                    child: const Text('L??u',
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
