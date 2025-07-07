import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';
import 'package:islami/pages/SuraDetails/SuraItem.dart';
import 'package:islami/pages/Tabs/Quran/QuranResources.dart';
import 'package:provider/provider.dart';

import '../../Providers/most_recent_provider.dart';

class Suradetailsscreen extends StatefulWidget {
  static const String routeName = '/SuraDetails';

  Suradetailsscreen({super.key});

  @override
  State<Suradetailsscreen> createState() => _SuradetailsscreenState();
}

class _SuradetailsscreenState extends State<Suradetailsscreen> {
  List<String> verses=[];
  int SelectedIndex = -1;
  late MostRecentProvider mostRecentProvider;
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        mostRecentProvider.getSavedSuraList();
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
   int index=ModalRoute.of(context)?.settings.arguments as int;
    mostRecentProvider=Provider.of<MostRecentProvider>(context);

    if(verses.isEmpty){
      loadfilecontent(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("${QuranResources.englishQuranSurahs[index]}",style:AppTextStyles.bold20primary,),
      ),
      body:Container(
        padding:EdgeInsets.symmetric(horizontal: w*0.02,),
        color:Appcolors.Black,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Appimages.TopLeft),
                Text("${QuranResources.arabicAuranSuras[index]}",style:AppTextStyles.bold24primary,),
                Image.asset(Appimages.Topright),

              ],
            ),
            SizedBox(height: h*0.02,),
            verses.isEmpty?Center(
              child:CircularProgressIndicator(backgroundColor:Appcolors.Primary,),
            ):
            Expanded(
              child:ListView.separated(
                separatorBuilder:(context, index) {
                  return SizedBox(height: h*0.002,);
                } ,
                itemBuilder:(context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    SelectedIndex = index;
                  });
                },
                child: Suraitem(
                    SuraVerse: verses[index],
                    index: index,
                  selectedIndex:SelectedIndex,

                ),
              );
            },
              itemCount: verses.length,
            )),
            Image.asset(Appimages.bottomMosque)
          ],
        ),
      )
    );
  }

  void loadfilecontent(int index) async{
    String filecontent= await rootBundle.loadString(
      'assets/files/${index+1}.txt',
    );
   List<String>Lines  = filecontent.split("\n");
   verses=Lines;
   Future.delayed(Duration(seconds: 2),() =>setState(() {
     
   }));
  }
}
