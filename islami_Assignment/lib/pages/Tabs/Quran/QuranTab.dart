import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';
import 'package:islami/pages/Tabs/Quran/QuranResources.dart';
import 'package:islami/pages/Tabs/Quran/widgets/CustLV.dart';
import 'package:islami/pages/Tabs/Quran/widgets/LVsuras.dart';

class QuranTab extends StatefulWidget {
  List<int> SearchIndices=List.generate(114, (index) => index,);
   QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset:true,
      body: Container(
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
              onChanged:(newText) {
                searchItem(newText,context);
                setState(() {

                });
              },
            ),
            SizedBox(height: height*0.02,),
            Custlv(),
            SizedBox(height: height*0.010,),
            Text("Suras List",style:AppTextStyles.bold16white,),
            SizedBox(height: height*0.016,),
            Lvsuras(SearchIndices:widget.SearchIndices,),



          ],
        ),
      ),
    );
  }

   searchItem(String newText,BuildContext context){
    List<int> FilteredItems=[];
    for(int i=0;i<QuranResources.englishQuranSurahs.length;i++){
      if(QuranResources.englishQuranSurahs[i].toLowerCase().contains(newText.toLowerCase()) || QuranResources.arabicAuranSuras[i].toLowerCase().contains(newText.toLowerCase())){
        FilteredItems.add(i);
      }
    }
    widget.SearchIndices=FilteredItems;
  }

}
