import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/core/app_textstyles.dart';
import 'package:islami/hadeeth/hadeeth.dart';

class Hadeethcontainer extends StatefulWidget {
  int index;
   Hadeethcontainer({super.key,required this.index});
   Hadeeth? hadeeth1;

  @override
  State<Hadeethcontainer> createState() => _HadeethcontainerState();
}

class _HadeethcontainerState extends State<Hadeethcontainer> {
  @override
  void initState() {
    super.initState();
    LoadHadeethFile(widget.index);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical:10,horizontal: 10 ),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(20),
        color:Appcolors.Primary,
        image:DecorationImage(image:AssetImage(Appimages.hadeethBackgroundImage))
      ),
      child:widget.hadeeth1==null?Center(child:CircularProgressIndicator(color:Appcolors.Black,),):
      Column(
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(Appimages.topleftcornerH),
              Expanded(child: Text(widget.hadeeth1?.title??"",style:AppTextStyles.bold20Black,)),
              Image.asset(Appimages.toprightcornerH),
            ],
          ),
          Expanded(child: SingleChildScrollView(child: Text(widget.hadeeth1?.content??"",style:AppTextStyles.bold20Black,))),
          Image.asset(Appimages.bottomRadioMosque)
        ],
      ),
    );
  }
  void LoadHadeethFile(int index) async {
    Hadeeth? hadeeth = await HadeethCache.getHadeeth(index);
    if (mounted) {
      setState(() {
        widget.hadeeth1 = hadeeth;
      });
    }
  }
}
