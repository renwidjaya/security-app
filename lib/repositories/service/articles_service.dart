import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:security_app/repositories/model/articles_model.dart';
import 'package:security_app/utils/constants_utils.dart';

class ArticlesService {
  Future<Articles> getAllArticles() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer 2|bExFDWdnVzZTlKfrr7zDPyEDtUlBNxX8Yn44L74z'
      };
      final response = await http.get(
        Uri.parse(
          ConstantsUtils.baseUrl + ConstantsUtils.articles,
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final result = Articles.fromJson(
          json.decode(response.body),
        );
        return result;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      throw 'No Connection Internet';
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
