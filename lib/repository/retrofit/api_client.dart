import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_emp_project/repository/model/employeeListNode.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "http://202.40.190.117:8082/ERAHRMAPPS/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;


  @POST("/EmployeeListS")
  @FormUrlEncoded()
  Future<ResponseData> getEmp(
      @Field("request_code") String request_code,
      );
}