

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_test_project/model/product_model.dart';
class ProductServices {


  static Future<Products> getProductDetails(productId) async {
    final response = await http.get(
        Uri.parse("https://dummyjson.com/products/$productId"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final product = Products.fromJson(jsonResponse);
      return product;
    } else {
      throw Exception('Failed to load product details');
    }
  }

}
