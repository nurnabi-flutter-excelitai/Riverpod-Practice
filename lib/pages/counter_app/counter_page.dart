
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/global/global_data.dart';

import '../../main.dart';

class CounterApp extends StatelessWidget {


  _incrementCounter( WidgetRef ref) {
    ref.read(GlobalData.counterProvider).incrementValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Consumer(
        builder: (context,ref,child){
          final counter = ref.watch(GlobalData.counterProvider);
          final title = ref.watch(GlobalData.titleText);
          return  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title.toString()),
                  Text('${counter.value}')

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