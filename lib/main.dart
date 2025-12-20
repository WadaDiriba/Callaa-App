// ...existing code...
import 'package:callaa_app/core/constants/app_constant.dart';
import 'package:callaa_app/features/auth/data/repository/auth_repository.dart';
import 'package:callaa_app/features/auth/presentation/pages/home_page.dart';
import 'package:callaa_app/features/auth/presentation/pages/login_page.dart';
import 'package:callaa_app/features/auth/presentation/pages/registration_page.dart';
import 'package:callaa_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:callaa_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(


        AuthRepository(),
        
      ),
      child: const CallaaApp(),
    ),
  );
  
}

class CallaaApp extends StatelessWidget {
  const CallaaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.appName,

      theme: AppTheme.darkTheme,

      darkTheme: AppTheme.darkTheme,

      debugShowCheckedModeBanner: false,

      initialRoute: "/login",
      routes: {
        
        // provide a "/" route or change initialRoute
        "/login": (context) =>LoginPage (),
    
        "/register":(context)=>RegistrationPage(),
        
         "/home":(context)=>HomePage(),


      },
    );
  }
}
