import 'package:flutter/material.dart';
import 'package:project/screens/dashboard.dart';
import 'package:project/utils/dbhelper.dart';
import 'package:project/entities/student.dart';
import 'package:http/http.dart' as http;

class EditStudent extends StatefulWidget {
  static const routeName = '/edit';
  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final strFirstName = TextEditingController();
  final strLastName = TextEditingController();
  final strAddress = TextEditingController();
  final strCourse = TextEditingController();
  final strPhone = TextEditingController();
  final strMail = TextEditingController();
  final strStatus = TextEditingController();
  final strId = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late DBHelper dbHelper;
  late Student student;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    student = ModalRoute.of(context)?.settings.arguments as Student;
    strFirstName.text = student.firstName.toString();
    strLastName.text = student.lastName.toString();
    strAddress.text = student.address.toString();
    strCourse.text = student.course.toString();
    strPhone.text =
        student.phone.toString() == 'null' ? '' : student.phone.toString();
    strMail.text =
        student.mail.toString() == 'null' ? '' : student.mail.toString();
    strStatus.text = student.status.toString();
    strId.text = student.id.toString();
  }

//cleanInput
  cleanText() {
    strFirstName.clear();
    strLastName.clear();
    strAddress.clear();
    strCourse.clear();
    strPhone.clear();
    strMail.clear();
    strStatus.clear();
  }

  funcSave() async {
    if (strFirstName.text != '' &&
        strLastName.text != '' &&
        strAddress.text != '' &&
        strCourse.text != '' &&
        strStatus.text != '') {
      var url;
      if (strPhone.text != '' || strMail.text != '') {
        url = Uri.parse(
            'http://api.phanmemquocbao.com/api/Doituong/updateObjects?id=${strId.text}&p0=${strLastName.text}&p1=${strFirstName.text}&p2=${strAddress.text}&p3=${strCourse.text}&p4=${strPhone.text}&p5=${strMail.text}&p6=${strStatus.text}&tokenup=lethibaotran');
      } else {
        url = Uri.parse(
            'http://api.phanmemquocbao.com/api/Doituong/updateObjects?id=${strId.text}&p0=${strLastName.text}&p1=${strFirstName.text}&p2=${strAddress.text}&p3=${strCourse.text}&p4=${''}&p5=${''}&p6=${strStatus.text}&tokenup=lethibaotran');
      }
      // var response = await http.get(url);
      await http.get(url);
      back() {
        // cleanText();
        return Navigator.of(context).pop();
      }

      // ignore: await_only_futures
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Thông báo'),
              content: const Text('Cập nhật sinh viên thành công!'),
              actions: [
                TextButton(
                  onPressed: () {
                    // return Navigator.of(context).pop();
                    Navigator.pop(context);
                    return back();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Cập nhật thông tin'),
      ),
      body: Padding(
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
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                        controller: strLastName,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                            labelText: 'Họ')),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                        controller: strFirstName,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                            labelText: 'Tên')),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: strAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Địa chỉ*'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: strCourse,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'MSSV* '),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: strPhone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'SĐT'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: strMail,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Mail'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: strStatus,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Status*'),
              ),
            ),
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
