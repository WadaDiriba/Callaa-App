import 'package:callaa_app/core/constants/app_constant.dart';
import'package:flutter/material.dart';

class AppTheme {

  static ThemeData darkTheme=ThemeData(

    scaffoldBackgroundColor:Color(AppConstant.darkThemebackgroundColors),




  );

  static ThemeData lightTheme=ThemeData(

    scaffoldBackgroundColor:Color(AppConstant.lightThemebackgroundColors),
  );
}