import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/App-images.dart';
import 'package:islami/core/app_textstyles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0.0;
  int SebhaCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى", style: AppTextStyles.bold36white,
              textDirection: TextDirection.rtl,),
            Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      turns += 1;
                      SebhaCounter++;
                    });
                  },
                  child: AnimatedRotation(
                    turns: turns,
                    duration: Duration(seconds:1),
                    child: Image.asset(Appimages.rotatingSebha),
                  ),
                ),
                SizedBox(height: 10,),
                Positioned(
                  top: 190,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getSebhaZekr(),
                      SizedBox(height: 20,),
                      Text("$SebhaCounter", style: AppTextStyles.bold36white,)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getSebhaZekr() {
    List<String> zekr = [
      "سُبْحَانَ اللَّهِ",
      "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
      "أستغفر الله",
      "لَا إِلَهَ إِلَّا اللَّهُ",
      "اللَّهُ أَكْبَرُ"
    ];

    int index = (SebhaCounter ~/ 33) % zekr.length;

    return Text(zekr[index], style: AppTextStyles.bold36white,);
  }
}
