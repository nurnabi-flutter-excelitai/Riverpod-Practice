


import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/model/product_model.dart';
import 'package:http/http.dart' as http;



import 'package:state_notifier/state_notifier.dart';





class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super([]);


  ProductModel? _productModel;
  List<Products>? _productsList;

  ProductModel? get productModel => _productModel;
  List<Products>? get productsList => _productsList;


  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse("https://dummyjson.com/products/"));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final ProductModel _productModel = ProductModel.fromJson(jsonResponse);
        state = [_productModel,]; // Set the state to the fetched product model
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      // Handle errors here, such as network errors
      throw Exception('Failed to load products: $e');
    }
  }









}



