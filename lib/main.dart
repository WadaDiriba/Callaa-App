// lib/main.dart
import 'package:callaa_app/core/constants/app_constant.dart';
import 'package:callaa_app/core/networks/api_client.dart';
import 'package:callaa_app/features/auth/data/repository/auth_repository.dart';
import 'package:callaa_app/features/auth/presentation/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/providers/auth_provider.dart';

import 'features/auth/presentation/pages/login_page.dart';

import 'features/auth/presentation/pages/home_page.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //  Create ApiClient instance here
  final ApiClient apiClient = ApiClient(baseUrl: AppConstant.baseUrl);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //  Provide the ApiClient first
        Provider<ApiClient>(
          create: (_) => apiClient,
        ),
        
        //  Then create AuthRepository with the ApiClient
        ChangeNotifierProvider(
          create: (context) {
            final apiClient = Provider.of<ApiClient>(context, listen: false);
            return AuthProvider(
              AuthRepository(apiClient), //  Pass the ApiClient here
            );
          },
        ),
      ],
      child: MaterialApp(
        title: 'Chella Rewards',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/register': (context) => RegistrationPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
