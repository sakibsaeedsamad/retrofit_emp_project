import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_emp_project/repository/model/employeeListNode.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: 'http://10.11.201.180:8080/ERAHRMAPPS')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;



  @POST('/EmployeeListS')
  Future<ResponseData> getEmp(@Field("request_code") String request_code);
}