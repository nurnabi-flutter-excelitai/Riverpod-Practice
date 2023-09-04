

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/api_services/joke_services.dart';
import 'package:riverpod_test_project/api_services/product_service.dart';
import 'package:riverpod_test_project/pages/jokes/jokes_page.dart';
import 'package:riverpod_test_project/pages/state_notifier_provider_page/product_page.dart';
import 'package:riverpod_test_project/provider/counter_provider.dart';
import 'package:riverpod_test_project/provider/product_notifier_provider.dart';

import 'model/product_model.dart';






void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: ProductPage(),
    );
  }
}





