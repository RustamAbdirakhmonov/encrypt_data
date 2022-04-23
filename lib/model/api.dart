
import 'package:dio/dio.dart';

class ApiResult{
   String uri="https://mobile.unired.uz/v4/demo-test";

   Future<String> postEncryption(String str) async{
      final response= await Dio().post(uri,data: {'data':str});
      Map<String,dynamic> status= response.data;
      print(status['status']);
      return status['status'].toString();
   }
}