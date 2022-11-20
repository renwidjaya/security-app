import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:security_app/utils/constants_utils.dart';
import 'package:security_app/utils/shared_preferance_utils.dart';
import 'package:security_app/repositories/model/login_model.dart';
import 'package:security_app/repositories/service/satker_service.dart';

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
      Dataprefs.setListData(
          Keys.user, [DataLogin.fromJson(json.decode(response.body)['data'])]);
      Dataprefs.setSinggleData(Keys.token, json.decode(response.body)['token']);
      var result = LoginModel.fromJson(json.decode(response.body));
      await getSatker(result.data.satkerId);
      return result;
    } else {
      throw 'Unauthecated';
    }
  }
}
