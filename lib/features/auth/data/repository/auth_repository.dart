import 'dart:convert';

import 'package:callaa_app/core/constants/app_constant.dart';
import 'package:http/http.dart' as http;
import 'package:callaa_app/features/auth/data/model/user_model.dart';

class AuthRepository {
  
  Future<UserModel> login(String username, String password) async {
    try {
    

      Uri url=Uri.parse('${AppConstant.baseUrl}users/login');

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      );


      if (response.statusCode == 201) {
      
        final data = jsonDecode(response.body);

      
        return UserModel.fromJson(data);
      } else {

        

 
             throw Exception("Your login info is incorrect try again ");

             
      }
    } catch (e) {

        print(e.toString());

        
             throw Exception("Your login info is incorrect try again ");

     
    }
  }
}



class AuthRepositoryR{

  Future<UserModel> register(String fristName,String lastName,String confirmpassword,String password,String email) async {


    try{

      Uri url=Uri.parse("http://example.com/api/v1/register");

      final response=await http.post(

                   url,
                  headers: {


                "Content-Type":"application/json",
                "accept":"application/json"
               },

               body: jsonEncode(

                  
                {
          "first_name": fristName,
          "last_name": lastName,
          "email": email,
         
                }
               )

              

      );

      if(response.statusCode==200){

        final data=jsonDecode(response.body);
        return UserModel.fromJson(data);


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