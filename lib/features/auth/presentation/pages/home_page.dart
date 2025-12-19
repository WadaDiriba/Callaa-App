
import 'package:callaa_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(


      builder: (context, authProvider, child) {

        if(authProvider.isloading){

          return  Scaffold(
             appBar: AppBar(

              title: Text("loadingscreen..."),
             ),
            
            body: Center(
            child: Text("loading screen Text..."),
            ),
          );
        }


        return Scaffold(

            appBar: AppBar(

              title: Text("loading ..."),
            ),

                body: Column(

                  children: [
                    Text("username:${authProvider.currentuser!.username}",
                    style: TextStyle(
                       color: Colors.yellow,
                      
                      fontSize: 18),),
                  ],
                ),
          );


   
      }
    );
  }
}