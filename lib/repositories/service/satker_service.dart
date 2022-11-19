import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:security_app/repositories/model/satker_model.dart';
import 'package:security_app/utils/constants_utils.dart';

class SatkerService {
  Future<Satkers> getSatker(int id) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final response = await http.get(
        Uri.parse(
          '${ConstantsUtils.baseUrl}${ConstantsUtils.satker}/$id',
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final result = Satkers.fromJson(
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