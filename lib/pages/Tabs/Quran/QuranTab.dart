import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';
import 'package:islami/pages/Tabs/Quran/widgets/CustLV.dart';
import 'package:islami/pages/Tabs/Quran/widgets/LVsuras.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding:EdgeInsets.symmetric(horizontal:width*0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style:AppTextStyles.bold16white,
            cursorColor:Appcolors.Primary,
            decoration: InputDecoration(
              prefixIcon:ImageIcon(AssetImage(Appimages.quranicon),color:Appcolors.Primary,),
              hintText: 'Sura name',
              hintStyle: Theme.of(context).textTheme.headlineLarge,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: Appcolors.Primary, width: 3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: Appcolors.Primary, width: 3),
              ),
            ),
          ),
          SizedBox(height: height*0.02,),
          Text("Most Recently",
            style:AppTextStyles.bold16white,
          ),
          SizedBox(height:height*0.010,),
          Custlv(),
          SizedBox(height: height*0.010,),
          Text("Suras List",style:AppTextStyles.bold16white,),
          SizedBox(height: height*0.016,),
          Lvsuras(),



        ],
      ),
    );
  }
}
