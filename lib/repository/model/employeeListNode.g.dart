// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employeeListNode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employees _$EmployeesFromJson(Map<String, dynamic> json) => Employees(
      joiningDate: json['joiningDate'] as String,
      mobile: json['mobile'] as String,
      bloodGroup: json['bloodGroup'] as String,
      employeeName: json['employeeName'] as String,
      designation: json['designation'] as String,
      email: json['email'] as String,
      PYEMPSEX: json['PYEMPSEX'] as String,
      employeeCode: json['employeeCode'] as String,
    );

Map<String, dynamic> _$EmployeesToJson(Employees instance) => <String, dynamic>{
      'joiningDate': instance.joiningDate,
      'mobile': instance.mobile,
      'bloodGroup': instance.bloodGroup,
      'employeeName': instance.employeeName,
      'designation': instance.designation,
      'email': instance.email,
      'PYEMPSEX': instance.PYEMPSEX,
      'employeeCode': instance.employeeCode,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      employee_list_nodes: json['employee_list_nodes'] as List<Employees>,
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'employee_list_nodes': instance.employee_list_nodes,
    };
