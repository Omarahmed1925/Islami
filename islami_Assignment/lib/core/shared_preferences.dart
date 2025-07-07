import 'package:shared_preferences/shared_preferences.dart';
class Keyshared{
  static const String mostRecentKey='most_recent';
}
void SaveSuraList(int newIndex)async{
  SharedPreferences pref=await SharedPreferences.getInstance();
   List<String> recentindices=pref.getStringList(Keyshared.mostRecentKey)??[];
   if(recentindices.contains('$newIndex')){
     recentindices.remove('$newIndex');
     recentindices.insert(0, '$newIndex');
   }else{
     recentindices.insert(0, '$newIndex');
   }
   if(recentindices.length>5){
     recentindices=recentindices.sublist(0,5);
   }
   await  pref.setStringList(Keyshared.mostRecentKey,recentindices);
}
