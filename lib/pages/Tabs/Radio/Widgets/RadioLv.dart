import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';

class Radiolv extends StatelessWidget {
   Radiolv({super.key});


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder:(context, index) {
          return Center(
            child: Stack(
              alignment:Alignment.center,
              children: [
                Container(
                  padding:EdgeInsets.only(top:height*0.04),
                  width:width*0.92,
                  height: height*0.142,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    color:Appcolors.Primary
                  ),
                  child:Image.asset(Appimages.bottomRadioMosque,),
                ),
                Column(
                  children: [
                    Text("Radio Ibrahim Al-Akdar",style:AppTextStyles.bold20Black,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed:(){}, icon:Icon(CupertinoIcons.play_fill,size:40,),color:Appcolors.Black,),
                        SizedBox(width:width*0.01,),
                        IconButton(onPressed:(){}, icon:Icon(CupertinoIcons.speaker_2_fill,size:30,),color:Appcolors.Black,),
                      ],
                    )

                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder:(context, index) =>  SizedBox(height:height*0.008 ,),
        itemCount: 10
    );
  }
}
