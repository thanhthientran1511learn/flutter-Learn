import 'package:flutter/material.dart';
import 'package:project/screens/me.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;

  @override
  initState() {
    count = 0;
    super.initState();
  }
  
  onGoBack() {
    // print('hello');
    count = 0;
  }

  funcCount() {
    count++;
    if (count == 5) {
      // return showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //           content: const Text('Trần Thiện Thanh - 18DH110724'),
      //           actions: [
      //             TextButton(
      //               onPressed: () {
      //                 count =0;
      //                 return Navigator.of(context).pop();
      //               },
      //               child: const Text('OK'),
      //             )
      //           ]);
      //     });
      return Navigator.push(context, MaterialPageRoute(builder: (context) => Me())).then(onGoBack());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: Center(
                    child: InkWell(
                        onTap: () => {funcCount()},
                        child: Container(
                          padding: const EdgeInsets.all(0.0),
                          child: const Text(
                            'Welcome to HomePage',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))))));
  }
}
