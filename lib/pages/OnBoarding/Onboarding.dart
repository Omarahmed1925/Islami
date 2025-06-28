import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app_textstyles.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/pages/HomePage.dart';

class Onboarding extends StatelessWidget {
  static const String routeName = '/onboarding';
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
   List<PageViewModel> pages = [
      PageViewModel(
        titleWidget: Image.asset(Appimages.islamiIcon),
        bodyWidget:Column(
          children: [
            Image.asset(Appimages.welcomeFrame),
            SizedBox(height: height*0.15,),
            Text(
              "Welcome to Islami App",
              style:AppTextStyles.bold24primary,
            ),
          ],
        ) ,

      ),
      PageViewModel(
        titleWidget: Image.asset(Appimages.islamiIcon),
        bodyWidget:Column(
          children: [
            SizedBox(height: height*0.03,),
            Image.asset(Appimages.Kaaba),
            SizedBox(height: height*0.05,),
            Text("Welcome To Islami",
                style:AppTextStyles.bold24primary,),
            SizedBox(height:height*0.05,),
            Text("We are very excited to have you in our community",
                style:AppTextStyles.bold20primary
            ),
          ],
        ) ,

      ),
      PageViewModel(
        titleWidget: Image.asset(Appimages.islamiIcon),
        bodyWidget:Column(
          children: [
            SizedBox(height: height*0.02,),
            Image.asset(Appimages.MosqueXquran),
            SizedBox(height: height*0.05,),
            Text("Reading the quran" ,style:AppTextStyles.bold24primary,),
            SizedBox(height: height*0.06,),
            Text("Read,and your lord is the Most Generous" ,style:AppTextStyles.bold20primary,),


          ],
        ) ,

      ),
      PageViewModel(
        titleWidget: Image.asset(Appimages.islamiIcon),
        bodyWidget:Column(
          children: [
            Image.asset(Appimages.duaa),
            SizedBox(height: height*0.05,),
            Text("Bearish",style:AppTextStyles.bold24primary,),
            SizedBox(height: height*0.08,),
            RichText(
              textAlign: TextAlign.center, // Apply to the whole text block
              text: TextSpan(
                style: AppTextStyles.bold20primary,
                children: [
                  TextSpan(text: "Praise the name of your Lord,\n"),
                  TextSpan(
                    text: "The Most High",
                    style: AppTextStyles.bold20primary,
                  ),
                ],
              ),
            )

          ],
        ) ,

      ),
      PageViewModel(
        titleWidget: Image.asset(Appimages.islamiIcon),
        bodyWidget:Column(
          children: [
            SizedBox(height: height*0.02,),
            Image.asset(Appimages.mic),
            SizedBox(height: height*0.05,),
            Text("Holy Quran Radio",style:AppTextStyles.bold24primary,),
            SizedBox(height: height*0.07,),
            RichText(
              textAlign: TextAlign.center, // Center the whole block
              text: TextSpan(
                style: AppTextStyles.bold20primary,
                children: [
                  TextSpan(
                    text: "You can listen to the Holy Quran Radio",
                  ),
                  TextSpan(
                    text: " through the application for free and easily",
                    style: AppTextStyles.bold20primary,
                  ),
                ],
              ),
            )



          ],
        ),

      ),
    ];

    return Scaffold(
      body:IntroductionScreen(
        dotsDecorator:DotsDecorator(
          color: Appcolors.Grey,
          activeColor: Appcolors.Primary,
            activeSize: const Size(22.0, 10.0),
          activeShape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          )
        ),
        done:Text("Finish",style: TextStyle(color: Appcolors.Primary,fontSize:20),),
        controlsPadding: EdgeInsets.all(10),
        next:Text("Next",style: TextStyle(color: Appcolors.Primary,fontSize:20),),
        back:Text("Back",style: TextStyle(color: Appcolors.Primary,fontSize:20),),
        pages:pages,
        showNextButton: true,
        showBackButton: true,
        onDone: (){
          Navigator.pushReplacementNamed(context, Homepage.routeName);
        },
        globalBackgroundColor:Appcolors.Blackbg,
        nextStyle: TextButton.styleFrom(
          alignment: Alignment.bottomRight,
          overlayColor: Appcolors.transparent,
        ),
        backStyle: TextButton.styleFrom(
          alignment: Alignment.bottomLeft,
          overlayColor: Appcolors.transparent,
        ),
        doneStyle: TextButton.styleFrom(
          alignment: Alignment.bottomRight,
          overlayColor: Appcolors.transparent,
        ),
        controlsMargin:EdgeInsets.symmetric(horizontal:3),
        bodyPadding: EdgeInsets.all(20),


      ),

    );

  }

}
