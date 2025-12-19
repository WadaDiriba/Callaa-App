
import 'package:callaa_app/features/auth/presentation/pages/registration_page.dart';
import 'package:callaa_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget{

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formkey=GlobalKey<FormState>();

  final  TextEditingController _username=TextEditingController();

  final TextEditingController _password=TextEditingController();

  bool ishidden=true;
@override
void dispose() {
  _username.dispose();
  _password.dispose();
  super.dispose();
}




   void login() async{

     String username=_username.text.trim();
      String password=_password.text.trim();
      
     print('$password-$username');
      


    final authProvider = Provider.of<AuthProvider>(context, listen: false);


   await authProvider.login(username, password);

      
if(authProvider.currentuser != null){


  Navigator.pushReplacementNamed(context, '/home');

ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
  content: Text(authProvider.currentuser!.getWellcomemesssage())
),


);
  }

  else{

ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(authProvider.error!)));

  }
   }
  void passwordshow(){

    setState(() {
      ishidden=!ishidden;
    });
  }


  

  @override

  Widget build(BuildContext context) {
    return   Scaffold(

      
         //added single childScrollview to enhance the login page of chella IT BE SCROLLABEL HERE
         body:SingleChildScrollView(

           child: Padding(
                   padding: const EdgeInsets.all(20),
                   child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
           
              // Title
              const Text(
                "Chella",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
           
              const SizedBox(height: 5),
           
              const Text(
                "Welcome back to your rewards",
                style: TextStyle(
                  color: Color.fromARGB(255, 180, 180, 180),
                  fontSize: 15,
                ),
              ),
           
              const SizedBox(height: 25),
           
              
              Container(
           
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1), 
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Form(

                 key: _formkey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Align(
                             
                        alignment:Alignment.center,
                        child: const Text(
                          "Login to Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                  
                        ),
                        
                      ),
                  
                           
                       Text(
                        "Username",
                        style: TextStyle(
                             
                          color: Colors.white70),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _username,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.3),
                          hintText: "Enter your username",
                          hintStyle: const TextStyle(color: Colors.white60),
                             
                          prefixIcon:Icon(Icons.person_2_outlined,color: Colors.white,),
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),


                        validator: (value){

                          if(value==null || value.isEmpty){

                            return " username is required";
                          }


                          if(value==" "){

                            return " usename cannot be space";
                          }

                          if(!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)){

                            return "username must be letter";


                          }
                          return null;
                        },

                        
                      ),
                             
                      const SizedBox(height: 20),
                             
                      
                      const Text(
                        "Password",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                             
                        controller: _password,
                        obscureText: ishidden,
                      
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                             
                          prefixIcon: Icon(Icons.lock,color: Colors.white,),
                             
                          suffixIcon: IconButton(
                             
                            color: Colors.white70,
                            onPressed: passwordshow,
                            
                             icon: Icon(
                             
                             
                              ishidden
                              ? Icons.visibility
                              :Icons.visibility_off,
                             ),
                  
                             
                          
                             ),             
                      
                         filled: true,
                          // ignore: deprecated_member_use
                          fillColor: Colors.grey.withOpacity(0.3),
                          // for the your  name is your name of the Name of the your,
                          
                          
                          hintText: "Enter your password",
                           hintStyle: const TextStyle(
                            color: Colors.white60),
                        
                         
                          border: OutlineInputBorder(
                             
                            
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),


                        validator: (value) {
                          
                           if(value==null || value.isEmpty){

                            return "password cannot be empty";
                           }

                          if (value.length < 6) {
                            
                            return "Password must be at least 6 characters";
                                 }




                          return null;
                        },
                      ),
                             
                      const SizedBox(height: 10),
                             
                           Align(
                             
                            alignment: Alignment.centerRight,
                             child: TextButton(
                              onPressed: (){
                  
                              //Navigator.push(context,MaterialPageRoute(builder:(context)=>ForgotPassword()));
                              }, 
                             
                              child: Text("ForgotPassword",
                              style: TextStyle(
                             
                            color: Colors.yellow.shade600,
                             fontSize: 13,
                             ),)),
                             
                             
                             
                           ),
                             
                             SizedBox(height: 100,),
                             
                         // LOGIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                             
                          onPressed: () {
                      if(_formkey.currentState!.validate()) {
                              login();
                              }
                               },




                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                           
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Login to Chella",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                             
                      const SizedBox(height: 20),
                             
                      Center(
                        child: Text(
                          "---Don't have an account?---",
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                             
                      const SizedBox(height: 15),
                             
                    
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                  
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>RegistrationPage()));
                          },
                          style: OutlinedButton.styleFrom(
                             
                            side: const BorderSide(
                             
                              color: Colors.yellow),
                             
                           
                             
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Create New Account",
                            style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
           
               Text(
                "By logging in, you agree to our Terms & Conditions",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
           
               const SizedBox(height: 20),
            ],
                   ),
                 ),
         ),
                
              
            
          
        );

                
                
              
  }
}