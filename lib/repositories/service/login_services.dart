import 'dart:convert';

import 'package:security_app/repositories/model/login_model.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  Future<LoginModel> login(String password) async {
    var body = jsonEncode({
      'password': password,
    });
    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse("https://api.security.nixsolusindo.com/login"),
      body: body,
      headers: headers,
    );

    final result = LoginModel.fromJson(
      json.decode(response.body),
    );
    
    return result;
    if (response.statusCode == 200) {
      return result;
    } else {
      throw 'Unauthecated';
    }
  }
}
