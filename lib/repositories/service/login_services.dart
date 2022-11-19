import 'dart:convert';

import 'package:security_app/repositories/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:security_app/utils/constants_utils.dart';

class LoginServices {
  Future<LoginModel> login(String password) async {
    var body = jsonEncode({
      'password': password,
    });
    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse(
        ConstantsUtils.baseUrl + ConstantsUtils.login,
      ),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var result = LoginModel.fromJson(json.decode(response.body));
      return result;
    } else {
      throw 'Unauthecated';
    }
  }
}
