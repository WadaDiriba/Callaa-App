import 'dart:convert';
import 'package:callaa_app/core/networks/api_exceptions.dart';

import 'package:http/http.dart' as http;
class ApiClient {
  final String baseUrl;
  final Map<String,String>defaultHeaders;
  ApiClient({
   required this.baseUrl,
   this.defaultHeaders = const{
    'Content-Type': 'application/json',
    'Accept':'application/json'
   }
  });
  //generic Get Method 
  Future<Map<String,dynamic>>get(
    String endpoint,{
      Map<String,String>? headers,
      Map<String, dynamic>? queryParams,
    }
  )async{
    try{
      final uri = Uri.parse('$baseUrl$endpoint').replace(queryParameters:queryParams);
      final response = await http.get(
        uri,
        headers:{...defaultHeaders,...?headers},
       // adds all headers to send as one header  ...
      );
      return _handleResponse(response);
    }
    catch(error){
       throw _handleError(error);
    }
  }
  //Generic post method
  Future<Map<String,dynamic>>post(
    String endpoint,{
      Map<String,dynamic>? body,
      Map<String,String>? headers,
    }
  )async{
    try{
      final response = await http.post
      ( Uri.parse("$baseUrl$endpoint"),
       headers: {...defaultHeaders,...?headers},

        body: jsonEncode(body),
         );
         return _handleResponse(response);
    }
    catch(error){
      throw _handleError(error);
    }
  }
  //Similar methods for Put,Patch,Delete
  Map<String,dynamic> _handleResponse(http.Response response){
    final statusCode = response.statusCode;
    final responseBody = jsonDecode(response.body);

    if(statusCode== 200 || statusCode == 201){
     // if response is List
      if(responseBody is List){
        return {'data':responseBody};
      }

      if(responseBody is Map<String,dynamic>){

        return responseBody;
      }

      throw ApiExceptions("Unknown format Exception");
    }


if(responseBody is Map<String, dynamic>){
   switch(statusCode){
   case 400:
   throw BadRequestException(responseBody['message']??'Bad request'
   );
   case 401:
   throw UnauthorizedException(responseBody['message']??'Resource not found');
   case 500:
   case 502:
   case 503:
   throw ServerException(responseBody['message']??'Server Error occurred');
   default:
   throw ApiExceptions(
    'Request failed with status: $statusCode',
    statusCode:statusCode,
   );
    }
}
   
      throw ApiExceptions("Unknown format Exception");
    
  }
  Exception _handleError(dynamic error){
    if(error is http.ClientException){
      return NetwrokException('No internet connection');
    }
    if(error is FormatException){
      return FormatException("invalid response format");
    }
    if(error is Exception){
      return error;
    }
    return ApiExceptions('Unknown error occurred');
  }
}
