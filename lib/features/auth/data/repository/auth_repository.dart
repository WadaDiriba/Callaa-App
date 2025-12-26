import 'dart:convert';


import 'package:callaa_app/core/networks/api_client.dart';
import 'package:callaa_app/core/networks/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:callaa_app/features/auth/data/model/user_model.dart';

class AuthRepository {


final ApiClient apiClient;
  AuthRepository(this.apiClient);
  
  Future<UserModel> login(String username, String password) async {
    try {
    



      final response = await apiClient.post(
        'users/login',
        body: {
          'username': username,
          'password': password,
        },
      );

     

      
        return UserModel.fromJson(response);

    }

    on ApiExceptions catch (e) {

      print(e.toString());

      

     

        

        rethrow;


             
      
    } catch (e) {

        throw Exception(e.toString());

        
     

     
    }
  
  }
}

class AuthRepositoryR{

  Future<bool> register(String fullName,String password,String username) async {


    try{

      Uri url=Uri.parse("https://chella-api.onrender.com/chella-api/users/register");

      final response=await http.post(

                   url,
                  headers: {


                "Content-Type":"application/json",
                "accept":"application/json"
               },

               body: jsonEncode(

                  
                {
          "fullName": fullName,
          
          "password": password,
          "username":username,
          
         
        
         
                }
               )

              

      );

       
         
      if(response.statusCode==201 ){

        
        return true;


      }

      else{

        throw Exception(" Registration is failed,please try again later");
      }



    }




    catch(e){

            throw Exception(" Regitration failed -> $e");
      
    }
  }
}