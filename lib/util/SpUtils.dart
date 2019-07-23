import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  static Future<List<String>> getSpList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  static Future<Map<String, List<String>>> getSpLists(List<String> key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, List<String>> list = {};
    for (var i in key) {
      list[i] = prefs.getStringList(i);
    }
    return list;
  }

  static setSpList(String key, List<String> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, list);
  }

  static setSpLists(Map<String, List<String>> map) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var i in map.entries) {
      prefs.setStringList(i.key, map[i.key]);
    }
  }
}
