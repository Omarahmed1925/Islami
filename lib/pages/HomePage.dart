import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/App-images.dart';

class Homepage extends StatelessWidget {
  static const String routeName = '/homepage';
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration:BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/quran_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(),
      ),
    );
  }
}
