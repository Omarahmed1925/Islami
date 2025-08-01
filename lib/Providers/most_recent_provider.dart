import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier{
  List<int> mostRecentList=[];
  void getSavedSuraList()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    List<String>ReceivedIndices =prefs.getStringList(Keyshared.mostRecentKey)??[];
    mostRecentList=ReceivedIndices.map((e) => int.parse(e),).toList();
    notifyListeners();
  }

}