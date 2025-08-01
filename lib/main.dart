import 'package:flutter/material.dart';
import 'package:islami/Providers/most_recent_provider.dart';
import 'package:islami/core/app-theme.dart';
import 'package:islami/pages/HomePage.dart';
import 'package:islami/pages/OnBoarding/Onboarding.dart';
import 'package:islami/pages/SuraDetails/SuraDetailsScreen.dart';
import 'package:islami/pages/suradetails2/SuraDetailsScreen2.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create:(context) =>MostRecentProvider(),child: const MyApp()));
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
        Suradetailsscreen.routeName: (context) => Suradetailsscreen(),
        Suradetailsscreen2.routeName: (context) => Suradetailsscreen2(),
      },
    );
  }
}

