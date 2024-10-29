import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import "package:trivia/models/question.dart";

const url = "https://the-trivia-api.com/api/questions?limit=10";

Future<List<Question>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse(url));

  return compute(parsePhotos, response.body);
}

List<Question> parsePhotos(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Question>((json) => Question.fromJson(json)).toList();
}

final questionsProvider = FutureProvider((ref) async {
  final response = fetchPhotos(http.Client());
  return response;
});
