// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employeeListNode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employees _$EmployeesFromJson(Map<String, dynamic> json) => Employees(
      joining_date: json['joining_date'] as String,
      mobile: json['mobile'] as String,
      blood_group: json['blood_group'] as String,
      employee_name: json['employee_name'] as String,
      designation: json['designation'] as String,
      email: json['email'] as String,
      PYEMPSEX: json['PYEMPSEX'] as String,
      employee_code: json['employee_code'] as String,
    );

Map<String, dynamic> _$EmployeesToJson(Employees instance) => <String, dynamic>{
      'joining_date': instance.joining_date,
      'mobile': instance.mobile,
      'blood_group': instance.blood_group,
      'employee_name': instance.employee_name,
      'designation': instance.designation,
      'email': instance.email,
      'PYEMPSEX': instance.PYEMPSEX,
      'employee_code': instance.employee_code,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      employee_list_nodes: json['employee_list_nodes'] as List<dynamic>,
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'employee_list_nodes': instance.employee_list_nodes,
    };
