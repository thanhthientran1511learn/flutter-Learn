import 'package:flutter/material.dart';
// import 'package:project/screens/dashboard.dart';
import 'package:project/utils/dbhelper.dart';
import 'package:project/entities/student.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
                    return Navigator.pop(context);
                    // Navigator.pop(context);
                    // return back();
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
        title: const Text('Thông tin sv'),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: true,
        // padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
            ),
            CircleAvatar(
              // child: Text(widget.students[index].firstName.toString()[0]),
              radius: 50,
              child: Text(getName(strFirstName.text)),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 30,
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            //   child: const Text(
            //     'Thông tin sinh viên',
            //     style: TextStyle(
            //       color: Colors.blue,
            //       fontWeight: FontWeight.w500,
            //       fontSize: 30,
            //     ),
            //   ),
            // ),
            Container(
                alignment: Alignment.center,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade300,
                        onPrimary: Colors.white,
                      ),
                      // icon: const Icon(Icons.phone),
                      icon: strMail.text != 'null'
                          ? const Icon(Icons.mail)
                          : const Icon(Icons.clear),
                      label: strMail.text != 'null'
                          ? const Text('Mail')
                          : const Text(''),
                      onPressed: () async {
                        if (strMail.text != '') {
                          // ignore: deprecated_member_use
                          await launch('mailto: ${strMail.text}');
                        } else {
                          exceptionLaunch('địa chỉ Mail');
                        }
                      },
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                        onPrimary: Colors.white,
                      ),
                      // icon: const Icon(Icons.phone),
                      icon: const Icon(Icons.location_on_outlined),
                      label: const Text("Địa chỉ"),
                      onPressed: () async {
                        if (strAddress.text != '') {
                          // ignore: deprecated_member_use
                          await launch('https://www.google.com/maps/search/${strAddress.text}');
                        } else {
                          exceptionLaunch('địa chỉ');
                        }
                      },
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                      // icon: const Icon(Icons.phone),
                      icon: strPhone.text != 'null'
                          ? const Icon(Icons.phone)
                          : const Icon(Icons.clear),
                      label: strPhone.text != 'null'
                          ? const Text("Call")
                          : const Text(''),
                      onPressed: () async {
                        if (strPhone.text != '') {
                          // ignore: deprecated_member_use
                          await launch('tel: ${strPhone.text}');
                        } else {
                          exceptionLaunch('số điện thoại');
                        }
                      },
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
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
                    border: OutlineInputBorder(), labelText: 'Tình trạng*'),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
                      child: SizedBox(
                        width: 150,
                        height: 41,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            onSurface: Colors.grey,
                          ),
                          child: const Text('Xoá',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          onPressed: () {
                            handelRequiredDelete(strId.text);
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
                      child: SizedBox(
                        width: 150,
                        height: 41,
                        child: ElevatedButton(
                          child: const Text('Cập nhật',
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
                ]),
          ],
        ),
      ),
    );
  }

  getName(String str) {
    List<String> result = str.split(" ");
    if (result.length > 1) {
      return result[1].toUpperCase();
    } else {
      return result[0].toUpperCase();
    }
  }

  exceptionLaunch(String str) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thông báo'),
            content: Text('Chưa lưu ' + str + ' !'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  handelRequiredDelete(String userId) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Xoá'),
            content: const Text('Chắc chắn xoá ?'),
            actions: [
              TextButton(
                onPressed: () {
                  handleDeleteUser(userId);
                  Navigator.of(context).pop();
                },
                child: const Text('Có'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Không'),
              ),
            ],
          );
        });
  }

  handleDeleteUser(String userId) async {
    try {
      var url = Uri.parse(
          'http://api.phanmemquocbao.com/api/Doituong/deleteObject?id=$userId&tokende=lethibaotran');
      await http.get(url);
      return Navigator.of(context).pop();
    } catch (err) {
      print(err);
    }
  }
}
