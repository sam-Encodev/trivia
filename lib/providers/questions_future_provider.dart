import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import "package:trivia/models/question.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

const url = "https://the-trivia-api.com/api/questions?limit=15";

Future<List<Question>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse(url));

  return compute(parsePhotos, response.body);
}

List<Question> parsePhotos(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Question>((json) => Question.fromJson(json)).toList();
}

final questionsFutureProvider = FutureProvider((ref) async {
  final response = fetchPhotos(http.Client());
  return response;
});


