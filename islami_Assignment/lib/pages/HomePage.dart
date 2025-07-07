import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/pages/Tabs/Hadeth/HadethTab.dart';
import 'package:islami/pages/Tabs/Quran/QuranTab.dart';
import 'package:islami/pages/Tabs/Radio/RadioTab.dart';
import 'package:islami/pages/Tabs/Timer/TimerTab.dart';
import 'package:islami/pages/Tabs/sebha/sebhaTab.dart';

class Homepage extends StatefulWidget {
  static const String routeName = '/homepage';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var width = 0.0;
  var height = 0.0;
  int currentIndex = 0;
  List<String> icons=[
    Appimages.quranicon,
    Appimages.Hadithicon,
    Appimages.sebhaicon,
    Appimages.Radioicon,
    Appimages.Timericon
  ];
  List<String> imgs=[
    Appimages.QuranPG,
    Appimages.HadethBg,
    Appimages.sebhaBg,
    Appimages.radioBg,
    Appimages.timerbg
  ];
  List<Widget> tabs =[
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimerTab()
  ];


  @override
  Widget build(BuildContext context) {
   width= MediaQuery.of(context).size.width;
    height= MediaQuery.of(context).size.height;
    return Container(
      decoration:BoxDecoration(
        image: DecorationImage(image:AssetImage(imgs[currentIndex]), fit: BoxFit.cover),
      ),
      child:Scaffold(
        bottomNavigationBar:Theme(
          data: Theme.of(context).copyWith(canvasColor: Appcolors.Primary),
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: buildBottom(index:0, ImagePath: Appimages.quranicon),
                    label: "Quran"),
                BottomNavigationBarItem(
                    icon: buildBottom(index:1, ImagePath: Appimages.Hadithicon),
                    label: "Hadith"),
                BottomNavigationBarItem(
                    icon: buildBottom(
                        index: 2, ImagePath: Appimages.sebhaicon),
                    label: "sebha"),
                BottomNavigationBarItem(
                    icon: buildBottom(index:3, ImagePath: Appimages.Radioicon),
                    label: "Radio"),
                BottomNavigationBarItem(
                    icon: buildBottom(index:4, ImagePath: Appimages.Timericon),
                    label: "Timer"),
              ]
          ),
        ),
        body:SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Appimages.islamiIcon),
              Expanded(child:tabs[currentIndex]),
            ],
          ),
        ),

      ),
    );
  }
  Widget buildBottom({required int index,required String ImagePath}) {
    return  currentIndex==index ?
      Container(
        width:width*0.136,
       height:height*0.036,
      decoration: BoxDecoration(
        color: Appcolors.Blackbg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ImageIcon(AssetImage(ImagePath))):
          ImageIcon(AssetImage(ImagePath));

  }
}
