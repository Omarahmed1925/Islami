import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami/pages/Tabs/Hadeth/widgets/HadeethContainer.dart';
import 'package:islami/hadeeth/hadeeth.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;
  bool _isPreloading = true;

  @override
  void initState() {
    super.initState();
    _preloadInitialHadith();
  }

  Future<void> _preloadInitialHadith() async {
    // Preload the first 5 hadith for better performance
    for (int i = 1; i <= 5; i++) {
      await HadeethCache.getHadeeth(i);
    }
    if (mounted) {
      setState(() {
        _isPreloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    
    if (_isPreloading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.amber),
            SizedBox(height: height * 0.02),
            Text(
              "Loading Hadith...",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      );
    }
    
    return Padding(
      padding:EdgeInsets.only(bottom:height*0.02),
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: height*0.66,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
                // Preload next few hadith when user scrolls
                _preloadNearbyHadith(index);
              },
              // Optimize for better performance
              viewportFraction: 0.8,
              enableInfiniteScroll: false,
            ),
            items: List.generate(50,(index) =>index+1,).map((i) {
              return Builder(
                builder: (BuildContext context) {
                  // Only create container when it's close to being visible
                  return Hadeethcontainer(index:i,);
                },
              );
            }).toList(),
          ),
          // Add page indicator
          SizedBox(height: height*0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(50, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index 
                    ? Colors.amber 
                    : Colors.grey.withOpacity(0.5),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _preloadNearbyHadith(int currentIndex) {
    // Preload next 3 hadith for smooth scrolling
    for (int i = currentIndex + 1; i <= currentIndex + 3 && i <= 50; i++) {
      HadeethCache.getHadeeth(i);
    }
  }
}
