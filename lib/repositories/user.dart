import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sns_app/models/user.dart';

Future<List<User>> getUsers() async {
  final client = Client();

  try {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {'Accept': 'application/json'},
    );
    final List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList.map((json) => User.fromJson(json)).toList();
  } on Exception catch (err) {
    debugPrint('Error: $err');
    return [];
  } finally {
    client.close();
  }
}
