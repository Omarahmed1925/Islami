import 'package:flutter/material.dart';
import 'package:islami/core/app-colors.dart';

import 'app_textstyles.dart';

class Apptheme{
  static ThemeData darktheme=ThemeData(
    scaffoldBackgroundColor: Appcolors.transparent,
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
      selectedItemColor: Appcolors.white,
      unselectedItemColor: Appcolors.Black,
    ),
    textTheme: TextTheme(
       headlineLarge:AppTextStyles.bold16white,
    )
  );
}