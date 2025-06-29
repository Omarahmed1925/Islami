import 'package:flutter/material.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';
import 'package:islami/pages/SuraDetails/SuraDetailsScreen.dart';
import 'package:islami/pages/Tabs/Quran/QuranResources.dart';

import '../../../suradetails2/SuraDetailsScreen2.dart';

class Lvsuras extends StatelessWidget {
  const Lvsuras({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap:(){
                Navigator.of(context).pushNamed(Suradetailsscreen2.routeName,arguments:index);
              },
              child: ListTile(
               leading:Stack(
                 alignment:Alignment.center,
                 children: [
                   CircleAvatar(
                     backgroundImage: AssetImage(Appimages.SuraNoContainer),
                     backgroundColor:Appcolors.transparent,
                   ),
                   Text("${index+1}",style:AppTextStyles.bold20white,)
                 ],
               ),
                title: Text("${QuranResources.englishQuranSurahs[index]}", style: AppTextStyles.bold20white),
                subtitle:Text("${QuranResources.AyaNumber[index]} Verses", style: AppTextStyles.bold20white),
                trailing:Text("${QuranResources.arabicAuranSuras[index]}", style: AppTextStyles.bold20white),
              ),
            );
          },
          separatorBuilder: (context, index) =>  Divider(
            color: Appcolors.white,
            thickness: 2,
            endIndent: width*0.1,
            indent: width*0.1,
          ),
          itemCount: QuranResources.englishQuranSurahs.length,
      ),
    );
  }
}
