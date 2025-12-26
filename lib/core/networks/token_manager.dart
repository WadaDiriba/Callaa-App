      import 'package:shared_preferences/shared_preferences.dart';

      class TokenManager {
        
        static const String _token="this out token";
        static const String _refreshTokenKey="this is refresh token";

       // Save token to local storage

        Future<void> savetoken(String token)async{


          final localStorage=await SharedPreferences.getInstance();
          await localStorage.setString(_token, token);
        }

       // we need to get token from local storage
        Future<String?> getToken() async{
          final localStorage=await SharedPreferences.getInstance();
          return localStorage.getString(_token);
        }

        // Delete token from local storage
        Future<void> deleteToken()async{

          final localStorage=await SharedPreferences.getInstance();

          await localStorage.remove(_token);
            await localStorage.remove(_refreshTokenKey);
        }

        //Check if token exixts

        Future<bool> hasToken()async{


          final token=await getToken();

          if(token !=null && token.isNotEmpty){

            return true;
          }
          else{
            return false;
          }


          //
        }


      }
 