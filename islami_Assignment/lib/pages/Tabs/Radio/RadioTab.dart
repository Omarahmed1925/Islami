import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/app-colors.dart';
import 'package:islami/pages/Tabs/Radio/Widgets/RadioLv.dart';
import 'package:islami/pages/Tabs/Radio/Widgets/RecitersLv.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ToggleSwitch(
              minWidth: double.infinity,
              cornerRadius: 10.0,
              activeBgColors: [[Appcolors.Primary], [Appcolors.Primary]],
              activeFgColor: Colors.black,
              inactiveBgColor: Appcolors.Blackbg,
              inactiveFgColor: Colors.white,
              initialLabelIndex: SelectedIndex,
              totalSwitches: 2,
              labels: ['Radio', 'Reciters'],
              fontSize: 15,
              radiusStyle: true,
              onToggle: (index) {
                setState(() {
                  SelectedIndex = index!;
                });
              },
            ),
          ),
          // Add some spacing
          SizedBox(height:height*0.02),
          // Conditionally display the widget based on SelectedIndex
          Expanded(
            child: SelectedIndex == 0
                ? Radiolv():RecitersLv(),

          ),
        ],
      ),
    );
  }

  Widget getRadioLv() {
    return Radiolv();
  }
}