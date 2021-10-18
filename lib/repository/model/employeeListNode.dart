import 'package:json_annotation/json_annotation.dart';

part 'employeeListNode.g.dart';

@JsonSerializable()
class Employees {
  String joiningDate;
  String mobile;
  String bloodGroup;
  String employeeName;
  String designation;
  String email;
  String PYEMPSEX;
  String employeeCode;

  Employees({
    required this.joiningDate,
    required this.mobile,
    required this.bloodGroup,
    required this.employeeName,
    required this.designation,
    required this.email,
    required this.PYEMPSEX,
    required this.employeeCode,
  });

  factory Employees.fromJson(Map<String, dynamic> json) =>
      _$EmployeesFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeesToJson(this);
}

@JsonSerializable()
class ResponseData {
  List<Employees>  employee_list_nodes;

  ResponseData({
    required this.employee_list_nodes,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
