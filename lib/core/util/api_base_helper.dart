import 'dart:convert';

import 'package:http/http.dart' as http;

const String api_base_Url = 'https://newsooq.waitbuzz.net/';

class ApiBaseHelper {
  static Future get({
    required String url,
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      Uri.parse(api_base_Url + url),
      headers: headers ??
          {
            "Accept": "application/json",
            "content-type": "application/json",
          },
    );
    return response;
  }

  static Future post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      Uri.parse(api_base_Url + url),
      body: jsonEncode(body),
      headers:headers ?? {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    return response;
  }
}
