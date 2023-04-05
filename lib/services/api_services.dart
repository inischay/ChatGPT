import 'dart:convert';
import 'dart:math';

import 'package:chatgpt_project/constants/const.dart';
import 'package:chatgpt_project/models/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$base_url/models"),
        headers: {"Authorization": "Bearer $api_key"},
      );
      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print("jsonResponse['error] ${jsonResponse['error']['meassage']}");
        throw Exception(jsonResponse['error']['message']);
      }
      print("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        log(value["id"]);
      }
      return ModelsModel.modelsModelSnapshot(temp);
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }
}
