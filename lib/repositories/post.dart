import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sns_app/models/post.dart';

Future<List<Post>> getPosts() async {
  final client = Client();

  try {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Accept': 'application/json'},
    );
    final List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList.map((json) => Post.fromJson(json)).toList();
  } on Exception catch (err) {
    debugPrint('Error: $err');
    return [];
  } finally {
    client.close();
  }
}
