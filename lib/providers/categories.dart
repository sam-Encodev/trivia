import 'package:riverpod_annotation/riverpod_annotation.dart';

class CategoryNotifier extends Notifier<List<dynamic>> {
  @override
  List build() => [];

  void add(value) {
    state.add(value);
  }

  void remove(value) {
    state.remove(value);
  }
}

final categoryNotifierProvider =
    NotifierProvider<CategoryNotifier, List<dynamic>>(() {
  return CategoryNotifier();
});
