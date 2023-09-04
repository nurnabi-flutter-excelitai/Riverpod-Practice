

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class Joke {
  String setup;
  String punchline;
  Joke(this.setup, this.punchline);
}



class JokeService{
  final _endPoint = Uri.parse('https://simple-joke-api.deno.dev/random');

  Future<Joke> getRandomJoke() async {
   var response = await http.get(_endPoint);
   var data = jsonDecode(response.body);
   await Future.delayed(Duration(seconds: 3));
   if(Random().nextDouble()<0.3){
     throw Exception('OOPs');
   }
   return Joke(data['setup'], data['punchline']);

  }


}