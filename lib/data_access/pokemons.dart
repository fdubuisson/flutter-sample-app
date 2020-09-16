import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/domain/pokemon.dart';

Future<List<Pokemon>> listPokemons(int start, int count) async {
  print("Loading pokemons [$start, $count]");
  final response = await http.get('https://pokeapi.co/api/v2/pokemon/?offset=$start&limit$count');

  if (response.statusCode == 200) {
    final results = jsonDecode(response.body);
    final summaries = results["results"] as List;

    return (await Future.wait(summaries.map((e) => http.get(e["url"]))))
        .map((response) => jsonDecode(response.body))
        .map((e) => Pokemon.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}
