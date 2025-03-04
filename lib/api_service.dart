import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> fetchPosts() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200 || response.statusCode == 201){
      return json.decode(response.body);
    }else{
      throw Exception("Failed to Load ApI");
    }
  }
}
