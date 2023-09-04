



// riverpod counter app

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_services/joke_services.dart';
import '../api_services/product_service.dart';
import '../model/product_model.dart';
import '../provider/counter_provider.dart';
import '../provider/product_notifier_provider.dart';

class GlobalData {


  static final counterProvider = ChangeNotifierProvider((ref) => CounterNotifier());


  static final titleText = Provider((ref) => 'You have pushed the button this many times:');


  static  final jokesFutureProvider = FutureProvider<Joke>((ref) async {
    return await JokeService().getRandomJoke();
  });



  static final productDetailsFutureProvider = FutureProvider.family<Products, int>((ref, productId) async {
    return await ProductServices.getProductDetails(productId);
  });


  static final productProvider = StateNotifierProvider.autoDispose<ProductNotifier, List<ProductModel>>(
        (ref) {
            final productNotifier = ProductNotifier();
             ref.onDispose(() {
             productNotifier.dispose();}); // Dispose the notifier when no longer needed
              productNotifier.fetchProducts(); // Fetch products immediately
                return productNotifier;},);






}