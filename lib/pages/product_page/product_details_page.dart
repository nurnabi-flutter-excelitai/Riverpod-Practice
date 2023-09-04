

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/global/global_data.dart';
import 'package:riverpod_test_project/main.dart';
import 'package:riverpod_test_project/model/product_model.dart';

class ProductDetailsPage extends ConsumerWidget {
  final int productId;

  ProductDetailsPage({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Products> productDetails = ref.watch(GlobalData.productDetailsFutureProvider(productId));

    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: productDetails.when(
        data: (product) {
          return ListView(
            children: [
              Image.network(
                product.thumbnail ?? '', // Use the actual field for the thumbnail
                height: 200,
                width: double.infinity,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(product.title ?? 'Product Name'),
                  Spacer(),
                  Text('\$${product.price?.toStringAsFixed(2) ?? '0.00'}'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                product.description ?? 'No description available',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          );
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          return Center(child: Text('Error loading product details'));
        },
      ),
    );
  }
}

