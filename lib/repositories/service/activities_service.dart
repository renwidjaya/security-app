import 'dart:convert';
import 'dart:io';

import 'package:security_app/repositories/model/activities_model.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants_utils.dart';

class ActivitiesService {
  Future<Activities> getAllActivities() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer 112|qMtikugzzS8CDnsEbPRI6bpXhJSyf1OA3e1L76W4'
      };
      final response = await http.get(
        Uri.parse(
          ConstantsUtils.baseUrl + ConstantsUtils.activities,
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final result = Activities.fromJson(
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