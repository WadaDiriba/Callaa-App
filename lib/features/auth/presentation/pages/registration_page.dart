import 'package:callaa_app/features/auth/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final TextEditingController _fristName=TextEditingController();
  final TextEditingController _lastName=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _phone=TextEditingController();

  final TextEditingController _confirmpassword=TextEditingController();
  bool ishidden=true;
  bool ischecked=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

       


       body: SingleChildScrollView(

        child: Padding(
          
          padding: EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [

              SizedBox(height: 50,),

              Align(
                alignment: Alignment.center,
                child: Text("Create Account",style:TextStyle(
                
                  color: Colors.amber,
                
                  fontSize: 26,
                
                ) ,
                
                ),

              
              ),

              SizedBox(height: 25,),

              Text("Come to chella reward",
              
              
              style: TextStyle(

                color: Colors.white70,

                fontSize: 15,
              ),
              ),

              SizedBox(height: 30,),

              Container(

                
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2), 
                  borderRadius: BorderRadius.circular(15),

                ),

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [


                     SizedBox(height: 25,),

                     Align(
                      alignment: Alignment.topLeft,
                      
                      child: Text("Frist Name:",
                      style: TextStyle(color: Colors.white),)),
                     TextField(

                      controller: _fristName,

                      decoration: InputDecoration(
                        labelText: "Fname",
                          filled: true,
                      fillColor: const Color(0xFF2D2D2D),
                         hintStyle:TextStyle(

                          color: Colors.white,
                        ),

                        hintText: " Enter FristName",

                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                     ),
                       SizedBox(height: 25,),
                       Align(
                      alignment: Alignment.topLeft,
                      
                      child: Text("Last Name:",
                      style: TextStyle(color: Colors.white),)),
                     TextField(

                      controller: _lastName,

                      decoration: InputDecoration(
                         labelText: "Lname",
                          filled: true,
                      fillColor: const Color(0xFF2D2D2D),
                         hintStyle:TextStyle(

                          color: Colors.white,
                        ),

                        hintText: "Enter your Last Name",

                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                     ),
                       SizedBox(height: 25,),
                       Align(
                      alignment: Alignment.topLeft,
                      
                      child: Text("email:",style: TextStyle(color: Colors.white),)),
                     TextField(

                      controller: _email,

                      decoration: InputDecoration(
                         labelText: "email",
                          filled: true,
                      fillColor: const Color(0xFF2D2D2D),
                         hintStyle:TextStyle(

                          color: Colors.white,
                        ),

                        hintText: "Enter Email",

                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                     ),
                       SizedBox(height: 25,),
                            Align(
                      alignment: Alignment.topLeft,
                      
                      child: Text("Phone Number:",
                      style: TextStyle(color: Colors.white),)),
                     TextField(

                      controller: _phone,
                      keyboardType: TextInputType.number,

                      decoration: InputDecoration(
                         labelText: "PhoneNumber",
                          filled: true,
                      fillColor: const Color(0xFF2D2D2D),
                         hintStyle:TextStyle(

                          color: Colors.white,
                        ),

                        hintText: "Enter phoneNumber",

                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                     ),
                     SizedBox(height: 25,),

                       Align(
                      alignment: Alignment.topLeft,
                      
                      child: Text("Password:",
                      style: TextStyle(color: Colors.white),)),
                     TextField(

                      controller: _password,

                      decoration: InputDecoration(
                         labelText: "Password",
                          filled: true,
                      fillColor: const Color(0xFF2D2D2D),

                         hintStyle:TextStyle(

                          color: Colors.white,
                        ),

                        hintText: "Enter password",

                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                     ),
                       SizedBox(height: 25,),

                       Align(
                      alignment: Alignment.topLeft,
                      
                      child: Text("ConfirmPassword:",
                      style: TextStyle(color: Colors.white),)),
                     TextField(

                      controller: _confirmpassword,

                      obscureText: ishidden,

                      decoration: InputDecoration(
                         labelText: "Confirmpassword",

                        hintStyle:TextStyle(

                          color: Colors.white,
                        ),

                        hintText: "Re-Enter password",

                        
                          filled: true,
                      fillColor: const Color(0xFF2D2D2D),

                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                     ),


                    SizedBox(height: 30,),

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
                          "Register to Chella",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                   SizedBox(height: 40,),

                   SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
           
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
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
                    
                  ],
                ),
              ),
        Checkbox(
          value: ischecked,
          onChanged: (bool? newValue) {
            setState(() {
              ischecked = newValue ?? false; 
            });
          },
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Before registering, you agree to our Terms & Conditions",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),

            ],

          
          ),

        
          
          
          
          ),
       ),

    );
  }
}