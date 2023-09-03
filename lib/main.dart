

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/api_services/joke_services.dart';
import 'package:riverpod_test_project/pages/jokes_page.dart';
import 'package:riverpod_test_project/provider/counter_provider.dart';




final counterProvider = ChangeNotifierProvider((ref) => CounterNotifier());
final titleText = Provider((ref) => 'You have pushed the button this many times:');

final jokesFutureProvider = FutureProvider<Joke>((ref) async{
  return await JokeService().getRandomJoke();
});


void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: MyHomePage(),
      home: JokesPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  _incrementCounter( WidgetRef ref) {
    ref.read(counterProvider).incrementValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Consumer(
        builder: (context,ref,child){
          final counter = ref.watch(counterProvider);
          final title = ref.watch(titleText);
          return  Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text(title.toString()),
          Text('${counter.value}')

          // Consumer(
          //   builder: (context, ref, child) {
          //     final counterNotifier = ref.watch(counterProvider);
          //     return Text(
          //       '${counterNotifier.value}',
          //       style: Theme.of(context).textTheme.headline4,
          //     );
          //   },
          // ),
          ],
          ));

        },

      ),


      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () => _incrementCounter(ref),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ),

    );
  }
}


