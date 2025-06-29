import 'package:flutter/material.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';

class Suraitem2 extends StatefulWidget {
  String Sura;

  Suraitem2({super.key,required this.Sura,});

  @override
  State<Suraitem2> createState() => _Suraitem2State();
}

class _Suraitem2State extends State<Suraitem2> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Text(
      widget.Sura,
      style: AppTextStyles.bold24primary,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
