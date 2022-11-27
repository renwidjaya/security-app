import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:security_app/repositories/model/articles_model.dart';

class Service {
  Future<List<Article>> getAllData() async{
    final response = await http.get(
      Uri.parse("https://api.security.nixsolusindo.com/activity"), 
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer 339|bfb8ifoaolpLahBdjtHS8REQwWSFT66cDH5RF3Hj'
      }
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
