import 'package:flutter/material.dart';
import 'package:islami/Providers/most_recent_provider.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';
import 'package:islami/pages/Tabs/Quran/QuranResources.dart';
import 'package:provider/provider.dart';

class Custlv extends StatefulWidget {
  Custlv({super.key});

  @override
  State<Custlv> createState() => _CustlvState();
}


class _CustlvState extends State<Custlv> {
 late MostRecentProvider mostRecentProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.getSavedSuraList();
    },);

  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider= Provider.of<MostRecentProvider>(context);
    return  Visibility(
      visible:mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
        Text("Most Recently",
        style:AppTextStyles.bold16white,
      ),
      SizedBox(height:height*0.010,),
      SizedBox(
        height:height*0.15,
        width: double.infinity,
        child: Expanded(
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding:EdgeInsets.symmetric(horizontal:width*0.03),
                  width:width*0.7,
                  decoration:BoxDecoration(
                    color:Appcolors.Primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${QuranResources.englishQuranSurahs[mostRecentProvider.mostRecentList[index]]}",style:AppTextStyles.bold24Black,),
                          Text("${QuranResources.arabicAuranSuras[mostRecentProvider.mostRecentList[index]]}",style:AppTextStyles.bold24Black,),
                          Text("${QuranResources.AyaNumber[mostRecentProvider.mostRecentList[index]]}",style:AppTextStyles.bold14Black,),
                        ],
                      ),
                      Image.asset(Appimages.SuraCardImage,width:width*0.32,)
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount:mostRecentProvider.mostRecentList.length
          ),
        ),
      )
        ],
      ),
    );
  }
}
