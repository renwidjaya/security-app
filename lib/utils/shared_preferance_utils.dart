import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Dataprefs {
  static setSinggleData(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  static setListData(key, List<dynamic> list) async {
    List<String> dataList = list.map((e) => json.encode(e)).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, dataList);
  }

  static getSinggleData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String item = prefs.getString(key) ?? "";
    return item;
  }

  static getListData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getStringList(key) ?? "[]";
    
    return result;
  }
}
