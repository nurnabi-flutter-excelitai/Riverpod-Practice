



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/global/global_data.dart';
import 'package:riverpod_test_project/pages/jokes/jokes_page.dart';
import 'package:riverpod_test_project/pages/product_page/product_details_page.dart';
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

              return Expanded(
                child: GridView.builder(
                  itemCount: productsList?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
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
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(child: Image.network(product.thumbnail ?? '')),
                            SizedBox(height: 8.0),
                            Text(product.title ?? 'Product Name', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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












