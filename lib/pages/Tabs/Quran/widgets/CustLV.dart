import 'package:flutter/material.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';

class Custlv extends StatelessWidget {
  const Custlv({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height:height*0.15,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding:EdgeInsets.symmetric(horizontal:width*0.03),
              width:width*0.658,
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
                      Text("Al-anbiya",style:AppTextStyles.bold24Black,),
                      Text("الانبياء",style:AppTextStyles.bold24Black,),
                      Text("112 Verses",style:AppTextStyles.bold14Black,),
                    ],
                  ),
                  Image.asset(Appimages.SuraCardImage)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: width * 0.02);
          },
          itemCount:10
      ),
    );
  }
}
