import 'package:shared_preferences/shared_preferences.dart';

class Dataprefs {
  static setSinggleData(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  static setListData(String key, data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, data);
  }

  static getSinggleData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String item = prefs.getString(key) ?? "";

    return item;
  }

  static getListData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? data = prefs.getStringList(key);

    return data;
  }
}
