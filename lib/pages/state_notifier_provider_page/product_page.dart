



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/global/global_data.dart';
import 'package:riverpod_test_project/pages/jokes/jokes_page.dart';
import 'package:riverpod_test_project/pages/state_notifier_provider_page/product_details_page.dart';
import '../../main.dart';


class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product App with Riverpod'),
        ),
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final products = ref.watch(GlobalData.productProvider);
              if (products.isEmpty) {
                return CircularProgressIndicator();
              }

              final productModel = products.first;
              final productsList = productModel.products;

              return ListView.builder(
                itemCount: productsList?.length,
                itemBuilder: (context, index) {
                  final product = productsList![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(productId: product.id),
                        ),
                      );
                    },

                    child: ListTile(
                      title: Text(product.title ?? ''),
                      subtitle: Text('\$${product.price?.toStringAsFixed(2) ?? ''}'),
                    ),
                  );
                },
              );
            },
          ),
        ),

        floatingActionButton: FloatingActionButton(

          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>JokesPage()));
          },
          child: Text('Next'),
        ),

      ),
    );
  }
}












