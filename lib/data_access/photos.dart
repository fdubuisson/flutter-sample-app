import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/domain/photo.dart';

Future<List<Photo>> fetchPhotos() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/photos');

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List).map((e) => Photo.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
