
import 'dart:convert';

import 'package:callaa_app/core/networks/api_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiClient {


final String baseUrl;
final Map<String,dynamic>defaultHeaders;



  ApiClient( {
    required this.baseUrl,
    this.defaultHeaders=const{

      "Content-Type": "application/json",
      "Accept": "application/json",
    
  },
    
    
    }
    );

    // Generic GET request

    Future<Map<String,dynamic>> get(
      String endpoint,{

        Map<String,String>? headers,
        Map<String,String>? queryParams,
      }
    
    )
    async{

      try{

        final uri=Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParams);


      // Make request
      final response=await http.get(
        uri,
        headers:{
          ...defaultHeaders,...?headers,
        } ,
      );
      // handle response

      return _handleResponse(response);
      }
      catch(error){
        throw _handleError(error);
      }
    }

    // Generic POST request 



   
Future<Map<String,dynamic>> post(
      String endpoint,{

        Map<String,String>? headers,
        Map<String,dynamic>? body,
      }
    
    )
    async{

      try{
        final response=await http.post(
          Uri.parse('$baseUrl$endpoint'), 

          headers:{
            ...defaultHeaders,...?headers,
          },

          body: jsonEncode(body),
        );


        return _handleResponse(response);
        }
        catch(e){
          throw _handleError(e);
        }

      }


    }


    Map<String,dynamic> _handleResponse(http.Response response){


       final statusCode=response.statusCode;

       final responseBody=jsonDecode(response.body);


      switch  (statusCode){
  case 200:
  case 201:
    return responseBody;

  case 400:
    throw BadRequestException(responseBody['message'] ?? 'Bad Request');

  case 401:
    throw UnauthorizedException(responseBody['message'] ?? 'Unauthorized');

  case 403:
    throw ForbiddenException(responseBody['message'] ?? 'Forbidden');

  case 404:
    throw NotFoundException(responseBody['message'] ?? 'Not Found');

  case 500:
  case 502:
  case 503:
    throw ServerException(responseBody['message'] ?? 'Server Error');

  default:
    throw ApiExceptions(

      'Unexpected error occurred with status code: $statusCode',
    );
}

    }


    Exception _handleError(dynamic error) {
  if (error is http.ClientException) {

    return NetwrokException('No internet connection');
  }
  
  if (error is FormatException) {
    return FormatException('Invalid response format');
  }
  
  if (error is Exception) {
    return error;
  }
  
  return ApiExceptions('Unknown error occurred');
}
