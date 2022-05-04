import 'dart:io';
import 'dart:typed_data';
import 'dart:core';
// ignore: unused_import
import 'package:flutter/services.dart';
import 'package:project/entities/student.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// ignore: duplicate_import
import 'package:path/path.dart';

class DBHelper {
  copyDB() async {
    // Construct a file path to copy database to
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "student.db");

// Only copy if the database doesn't exist
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      // Load database from asset and copy
      ByteData data = await rootBundle.load(join('assets', 'student.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await File(path).writeAsBytes(bytes);
    }
  }

  openDB() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'student.db');

    return await openDatabase(databasePath);
  }

  static final DBHelper db = DBHelper._();
  static Database? _database;

  DBHelper._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Students ("
          "id INTEGER PRIMARY KEY,"
          "firstName TEXT,"
          "lastName TEXT,"
          "address TEXT,"
          "course TEXT,"
          "phone TEXT,"
          "mail TEXT,"
          "status TEXT"
          ")");
    });
  }

  Future<List<Student>> getStudents() async {
    List<Student> data = <Student>[];
    Database? db = await database;
    // var list = await db.rawQuery('SELECT * FROM Students');
    List<Student> list = (await db?.query('Students'))!.cast<Student>();
    for (var item in list.toList()) {
     data.add(Student(
          id: item.id, lastName: item.lastName, firstName: item.firstName,address: item.address, course: item.course, phone: item.phone, mail: item.mail, status: item.status));
    }
    // for (var i = 0; i < list!.length; i++) {

    // }
    return data;
  }

  Future<int> insertStudent(Student student) async {
    Database? db = await database;
    Map<String, String> values = {
      'firstName': student.firstName.toString(),
      'lastName': student.lastName.toString(),
      'address': student.address.toString(),
      'course': student.course.toString(),
      'phone': student.phone.toString(),
      'mail': student.mail.toString(),
      'status': student.status.toString()
    };
    var result = db!.insert('Students', values);
    return result;
  }

  Future<int> updateStudent(Student student) async {
    Database? db = await database;
    Map<String, String> values = {
      'firstName': student.firstName.toString(),
      'lastName': student.lastName.toString(),
      'address': student.address.toString(),
      'course': student.course.toString(),
      'phone': student.phone.toString(),
      'mail': student.mail.toString(),
      'status': student.status.toString()
    };
    var result =
        db!.update('Students', values, where: 'id=?', whereArgs: [student.id]);
    return result;
  }

  Future<int> deleteStudent(int id) async {
    Database? db = await database;
    var result = db!.delete('Students', where: 'id=?', whereArgs: [id]);
    return result;
  }

  countStudent() async {
    Database? db = await database;
    var count = Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM Students'));
    return count;
  }
}