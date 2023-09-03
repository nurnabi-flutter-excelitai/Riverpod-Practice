




import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

// class CounterApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter App'),
//       ),
//       body: Center(
//         child: Consumer(
//           builder: (context, ref, child) {
//             final count = ref.watch(counterProvider);
//             return Text(count.toString());
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         backgroundColor: Colors.red,
//         onPressed: () => _incrementCounter(context),
//       ),
//     );
//   }
//
//   // Method for incrementing the counter value
//   void _incrementCounter(BuildContext context) {
//     context.read(counterProvider).incrementValue();
//   }
// }

