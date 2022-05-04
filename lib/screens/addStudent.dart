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
              title: const Text('Thông báo'),
              content: const Text('Thêm sinh viên thành công!'),
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
              title: const Text('Thông báo'),
              content: const Text('Chưa nhập đầy đủ thông tin.'),
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
      body: Padding(
        padding: const EdgeInsets.all(10),
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
                'Thêm thông tin sinh viên',
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
                controller: lastName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Họ*'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: firstName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Tên*'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: address,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Địa chỉ*'),
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
                    border: OutlineInputBorder(), labelText: 'SĐT'),
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
                    border: OutlineInputBorder(), labelText: 'Status*'),
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
