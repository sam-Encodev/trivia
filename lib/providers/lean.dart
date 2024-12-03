import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final currentQuestionIndex = Provider<int>((_) => throw UnimplementedError());

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final questionQtyProvider = StateProvider<int>((ref) {
  return 5;
});