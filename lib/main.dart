import 'package:flutter/material.dart';
import 'package:islami/core/app-theme.dart';
import 'package:islami/pages/HomePage.dart';
import 'package:islami/pages/OnBoarding/Onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme:Apptheme.darktheme ,
      themeMode:ThemeMode.dark  ,
      debugShowCheckedModeBanner: false,
      initialRoute:Onboarding.routeName,
      routes: {
      Onboarding.routeName: (context) => Onboarding(),
        Homepage.routeName: (context) => Homepage(),
      },
    );
  }
}

