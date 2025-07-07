import 'package:flutter/material.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';

class Suraitem extends StatefulWidget {
  String SuraVerse;
  int index;
  int selectedIndex;
  Suraitem({super.key,required this.SuraVerse, required this.index, required this.selectedIndex});

  @override
  State<Suraitem> createState() => _SuraitemState();
}

class _SuraitemState extends State<Suraitem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isSelected = widget.selectedIndex == widget.index;
    return Container(
      width:double.infinity,
      margin: EdgeInsets.symmetric(vertical: height*0.01),
      padding: EdgeInsets.symmetric(horizontal: height*0.01, vertical: width*0.03),
      decoration: BoxDecoration(
        border: Border.all(color: Appcolors.Primary, width: 2),
        borderRadius: BorderRadius.circular(15),
        color:isSelected ? Appcolors.Primary : Appcolors.transparent,

      ),
      child:Text("${widget.SuraVerse} [${widget.index+1}]",style:isSelected?AppTextStyles.bold24Black:AppTextStyles.bold24primary,textDirection:TextDirection.rtl,textAlign:TextAlign.center,),
    );
  }
}
