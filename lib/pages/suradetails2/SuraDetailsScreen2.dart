import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';
import 'package:islami/pages/SuraDetails/SuraDetailsScreen.dart';
import 'package:islami/pages/SuraDetails/SuraItem.dart';
import 'package:islami/pages/Tabs/Quran/QuranResources.dart';
import 'package:islami/pages/suradetails2/SuraItem2.dart';

class Suradetailsscreen2 extends StatefulWidget {
  static const String routeName = '/SuraDetails2';

  Suradetailsscreen2({super.key});

  @override
  State<Suradetailsscreen2> createState() => _Suradetailsscreen2State();
}

class _Suradetailsscreen2State extends State<Suradetailsscreen2> {
 String Sura='';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    int index=ModalRoute.of(context)?.settings.arguments as int;
    if(Sura.isEmpty){
      loadfilecontent(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("${QuranResources.englishQuranSurahs[index]}",style:AppTextStyles.bold20primary,),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Suradetailsscreen.routeName,arguments:index );
            },
            icon: Icon(Icons.format_line_spacing,color:Appcolors.Primary,),
          )
        ],
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
            Sura.isEmpty?Center(
              child:CircularProgressIndicator(backgroundColor:Appcolors.Primary,),
            ):Expanded(child: SingleChildScrollView(child: Suraitem2(Sura: Sura))),
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
   for(int i=0;i<Lines.length;i++){
    Lines[i] += ' [${i+1}] ';
   }
   Sura=Lines.join();
   Future.delayed(Duration(seconds: 2),() =>setState(() {
     
   }));
  }
}
