import 'package:flutter/material.dart';
import 'package:project/entities/student.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String data = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<List<Student>> getAllStudent() async {
    try {
      var url = Uri.parse(
          'http://api.phanmemquocbao.com/api/Doituong/getobjectsall?tokenget=lethibaotran');
      var response = await http.get(url);
      // ignore: avoid_print
      print(response.body);
      return Student.parseList(response);
    } catch (err) {
      // ignore: avoid_print
      print(err);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách SV'),
      ),
      body: Center(
        child: buildFutrueBuilderAssets(context),
      ),
    );
  }

  reloadScreen() {
    setState(() {});
  }

  buildFutrueBuilderAssets(BuildContext context) {
    return FutureBuilder(
      future: getAllStudent(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('Press button to Start.');
          case ConnectionState.active:
            return const Text('Press button to Start.');
          case ConnectionState.waiting:
            return const CircularProgressIndicatorPage();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // ignore: unnecessary_question_mark
              dynamic? listStudent = snapshot.data;
              return listStudent?.isNotEmpty
                  ? new ListEmployee(
                      students: listStudent,
                      reloadPage: reloadScreen,
                    )
                  : new Text("Empty!");
            }
        }
      },
    );
  }
}

// ignore: must_be_immutable
class ListEmployee extends StatefulWidget {
  Function reloadPage;
  List<Student> students;
  ListEmployee({Key? key, required this.students, required this.reloadPage})
      : super(key: key);

  @override
  _ListEmployeeState createState() => _ListEmployeeState();
}

class _ListEmployeeState extends State<ListEmployee> {
  funcEditUser(Student user) {
    // return Navigator.of(context)
    //    .pushNamed(EditUserScreen.routeName, arguments: user);

    // Ở đây Navigator qua page EditUser nhé - Mẫu ở trên kìa
  }

  handelRequiredDelete(int userId) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete User'),
            content: const Text('Are You Sure ?'),
            actions: [
              TextButton(
                onPressed: () {
                  handleDeleteUser(userId);
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
            ],
          );
        });
  }

  handleDeleteUser(int userId) async {
    try {
      var url = Uri.parse(
          'http://api.phanmemquocbao.com/api/info/DeleteAccount?accountId=$userId&token=lethibaotran');
      await http.get(url);
    } catch (err) {
      print(err);
    }
    widget.reloadPage();
  }

  Future<void> makePhoneCall(String phone) async {
    // ignore: deprecated_member_use
    if (await canLaunch('tel:$phone')) {
      // ignore: deprecated_member_use
      await launch('tel:$phone');
    } else {
      throw 'Could not launch $phone';
    }
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onLongPress: () {
            // edit value
            funcEditUser(widget.students[index]);
          },
          child: ListTile(
            title: Text(widget.students[index].firstName.toString() +
                " - " +
                widget.students[index].lastName.toString()),
            subtitle: Text(widget.students[index].address.toString()),
            leading: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
              icon: const Icon(Icons.phone),
              label: const Text("Call"),
              onPressed: () {
                makePhoneCall(widget.students[index].mail.toString());
              },
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
              ),
              child: const Text('Delete'),
              onPressed: () => handelRequiredDelete(widget.students[index].id),
            ),
          ),
        );
      },
      itemCount: widget.students == null ? 0 : widget.students.length,
    );
  }
}

class CircularProgressIndicatorPage extends StatelessWidget {
  const CircularProgressIndicatorPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      backgroundColor: Colors.blue,
      strokeWidth: 5,
    ));
  }
}
