
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget{

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final  TextEditingController _username=TextEditingController();

  final TextEditingController _password=TextEditingController();

  bool ishidden=true;


  void passwordshow(){

    setState(() {
      ishidden=!ishidden;
    });
  }

  @override


  Widget build(BuildContext context) {
    return   Scaffold(

      
         //added single childScrollview to enhance the login page of chella
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
                    TextField(
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
                    ),
           
                    const SizedBox(height: 20),
           
                    
                    const Text(
                      "Password",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 5),
                    TextField(
           
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
                           )),
           
                           
                          
                          
                        
                       filled: true,
                        fillColor: Colors.grey.withOpacity(0.3),
                        
                        hintText: "Enter your password",
                         hintStyle: const TextStyle(
                          color: Colors.white60),
                      
                       
                        border: OutlineInputBorder(
           
                          
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
           
                    const SizedBox(height: 10),
           
                         Align(
           
                          alignment: Alignment.centerRight,
                           child: TextButton(
                            onPressed: (){}, 
           
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
           
                        onPressed: () {},
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
                        onPressed: () {},
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
           
               Text(
                "By logging in, you agree to our Terms & Conditions",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
           
              // const SizedBox(height: 20),
            ],
                   ),
                 ),
         ),
                
              
            
          
        );

                
                
              
  }
}