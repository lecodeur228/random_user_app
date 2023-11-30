import 'dart:convert';

import 'package:contact_app/constants.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // recuper les users

  static Future getUserData() async {
    try {
      var url = Uri.parse(Constants.api_url);
      Response response = await http.get(url);
     
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
       
       
        return data;
      }
    } catch (e) {

    }
  }
}
