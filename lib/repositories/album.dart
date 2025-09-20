import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sns_app/models/album.dart';

Future<List<Album>> getAlbums() async {
  final client = Client();

  try {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: {'Accept': 'application/json'},
    );
    final List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList.map((json) => Album.fromJson(json)).toList();
  } on Exception catch (err) {
    debugPrint('Error: $err');
    return [];
  } finally {
    client.close();
  }
}
