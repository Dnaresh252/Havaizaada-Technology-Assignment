import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  final String baseUrl = "https://dummyjson.com/products";

  Future<List<Product>> fetchProducts(int skip, int limit) async {
    final Uri url = Uri.parse("$baseUrl?skip=$skip&limit=$limit");
    print("Fetching: $url");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> productsData = data['products'] ?? [];

        print("Fetched ${productsData.length} products");
        return productsData.map((json) => Product.fromJson(json)).toList();
      }
    } catch (e) {
      print("API Error: $e");
    }
    return [];
  }
}
