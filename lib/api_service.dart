import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static String url = 'https://jsonplaceholder.typicode.com/posts';
  static Future<List<dynamic>> fetchPosts() async {
    // String url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to Load ApI");
    }
  }

  static Future<Map<String,dynamic>> submitForm(
      String title, String desc) async {
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode({"title": title, "body": desc, "userId": 1}),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to Post Form");
      }
    } catch (e) {
      throw Exception("Erroe ${e.toString}");
    }
  }
}
