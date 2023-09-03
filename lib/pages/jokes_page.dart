

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/main.dart';

class JokesPage extends ConsumerWidget {
  const JokesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final jokeFuture = ref.watch(jokesFutureProvider);


    return Scaffold(
      body: Center(
        child: jokeFuture!=null?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: ()=>
               // ref.refresh(jokesFutureProvider),
                ref.refresh(jokesFutureProvider),
                child: const Text('Fetch joke')),
            SizedBox(height: 28,),
            jokeFuture.when(
                data: (joke)=>Column(
                  children: [
                    Text(joke.setup,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 15,),
                    Text(joke.punchline,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18))
                  ],
                ),
                error: (err,stack)=> Text('Error Loading joke'),
                loading: ()=> Text('loading.........'))
          ],
        ):Center(child: CircularProgressIndicator(),),
      ),
    );



  }
}

