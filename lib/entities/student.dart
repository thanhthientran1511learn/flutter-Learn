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
        firstName: json['P0'],
        lastName: json['P1'],
        address: json['P2'],
        course: json['P3'],
        phone: json['P4'],
        mail: json['P5'],
        status: json['P6'],
      );
}
