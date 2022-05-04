import 'dart:convert';

class Student {
  int id;
  String? firstName = '';
  String? lastName = '';
  String? address = '';
  String? course = '';
  String? phone = '';
  String? mail = '';
  String? status = '';

  Student({
    required this.id,
    this.firstName,
    this.lastName,
    this.address,
    this.course,
    this.phone,
    this.mail,
    this.status,
  });

  static List<Student> parseList(response) {
    var list = json.decode(response.body) as List;
    return list.map((e) => Student.fromJson(e)).toList();
  }

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['Id'],
        lastName: json['p0'],
        firstName: json['p1'],
        address: json['p2'],
        course: json['p3'],
        phone: json['p4'],
        mail: json['p5'],
        status: json['p6'],
      );
}
