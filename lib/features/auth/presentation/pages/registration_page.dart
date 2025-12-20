
import 'package:callaa_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

     class _RegistrationPageState extends State<RegistrationPage> {

    final TextEditingController _fullName=TextEditingController();
  final TextEditingController _password=TextEditingController();
final TextEditingController _Confirmpassword=TextEditingController();
  final TextEditingController _username=TextEditingController();

  @override
  void dispose() {
    _fullName.dispose();
    _Confirmpassword.dispose();
    _username.dispose();
    
    _password.dispose();
    
    super.dispose();
  }

  bool ishidden=true;
  bool ischecked=false;
  final  _formkey=GlobalKey<FormState>();

    void register() async{
      
        String fullName=_fullName.text.trim();
         String password=_password.text.trim();
      
         print("FullName:$fullName,Password:$password");

     
        

 final authProvider = Provider.of<AuthProvider>(context, listen: false);


  await authProvider.register(_fullName.text, _password.text,_username.text);
   
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

              Form(

                key: _formkey,
                child: Container(
                
                  
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2), 
                    borderRadius: BorderRadius.circular(15),
                
                  ),
                
                  child: Column(
                
                    mainAxisAlignment: MainAxisAlignment.start,
                
                    children: [
                
                
                      SizedBox(height: 20,),


                      Align(


                        alignment: Alignment.topLeft,
                        
                        child: Text("FullName:",
                        style: TextStyle(color: Colors.white),)),
                       TextFormField(
                
                        controller: _fullName,
                
                        decoration: InputDecoration(
                           labelText: "FullName",
                            filled: true,
                        fillColor: const Color(0xFF2D2D2D),
                
                           hintStyle:TextStyle(
                
                            color: Colors.white,
                          ),
                
                          hintText: "Enter FullName",
                
                          border: OutlineInputBorder(
                
                            borderRadius: BorderRadius.circular(20),
                          )
                        ),
                      ),


                          SizedBox(height: 25,),

                             Align(

                              alignment: Alignment.topLeft,

                              child: Text("Username:",

                              style: TextStyle(color: Colors.white),
                              
                              
                                  ),
                             ),

                        TextFormField(

                          controller: _username,
                          decoration: InputDecoration(
                             labelText: "Username",
                              filled: true,
                          fillColor: const Color(0xFF2D2D2D),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: "Enter username",
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
                       TextFormField(
                
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
                         
                
                    
                      SizedBox(height: 30,),
                
                     SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                           
                          onPressed: () {
                           if(_formkey.currentState!.validate()) {
                              register();
                              }
                          },
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
                
                           Navigator.pushReplacementNamed(context, '/login');
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
              ),
            ],
 
          ), 
          ),
       ),

    );
  }
}