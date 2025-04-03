import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/product_model.dart';

// class ProductService {
//   final String _baseUrl = "https://fakeapi.platzi.com/en/rest/products";

//   Future<List<Product>> fetchProducts(int offset, int limit) async {
//     final response = await http.get(Uri.parse("$_baseUrl?offset=0&limit=10"));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Product.fromJson(json)).toList();
//     } else {
//       throw Exception("Failed to load products");
//     }
//   }
// }


class ProductService {
  final String _baseUrl = "https://api.escuelajs.co/api/v1/products";

  Future<List<Product>> fetchProducts(int offset, int limit) async {
    final response = await http.get(Uri.parse("$_baseUrl?offset=$offset&limit=$limit"));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}

