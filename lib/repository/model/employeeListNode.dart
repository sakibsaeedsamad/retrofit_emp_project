import 'package:json_annotation/json_annotation.dart';

part 'employeeListNode.g.dart';

@JsonSerializable()
class Employees {
  String joining_date;
  String mobile;
  String blood_group;
  String employee_name;
  String designation;
  String email;
  String PYEMPSEX;
  String employee_code;

  Employees({
    required this.joining_date,
    required this.mobile,
    required  this.blood_group,
    required this.employee_name,
    required this.designation,
    required this.email,
    required this.PYEMPSEX,
    required this.employee_code,
  });

  factory Employees.fromJson(Map<String, dynamic> json) =>
      _$EmployeesFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeesToJson(this);
}

@JsonSerializable()
class ResponseData {


  List<dynamic> employee_list_nodes;



  ResponseData({
    required  this.employee_list_nodes,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
