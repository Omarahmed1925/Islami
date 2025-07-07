import 'package:flutter/services.dart';

class Hadeeth{
  String title;
  String content;

  Hadeeth({required this.title,required this.content});
}

// Cache manager for hadith content
class HadeethCache {
  static final Map<int, Hadeeth> _cache = {};
  
  static Future<Hadeeth?> getHadeeth(int index) async {
    // Check if already cached
    if (_cache.containsKey(index)) {
      return _cache[index];
    }
    
    try {
      // Load from file
      String filecontent = await rootBundle.loadString('assets/files/Hadeeth/h$index.txt');
      String title = filecontent.substring(0, filecontent.indexOf('\n'));
      String content = filecontent.substring(filecontent.indexOf('\n') + 1);
      
      Hadeeth hadeeth = Hadeeth(title: title, content: content);
      
      // Cache the result
      _cache[index] = hadeeth;
      
      return hadeeth;
    } catch (e) {
      print('Error loading hadith $index: $e');
      return null;
    }
  }
  
  static void clearCache() {
    _cache.clear();
  }
  
  static int get cacheSize => _cache.length;
}