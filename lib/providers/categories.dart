import 'package:trivia/models/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CategoryNotifier extends Notifier<List<Category>> {
  @override
  List<Category> build() => [
        Category(
          name: "Arts & Literature",
        ),
        Category(
          name: "Society & Culture",
        ),
        Category(
          name: "Science",
        ),
        Category(
          name: "Geography",
        ),
        Category(
          name: "Film & TV",
        ),
        Category(
          name: "General Knowledge",
        ),
        Category(
          name: "History",
        ),
        Category(
          name: "Music",
        ),
      ].reversed.toList();

  void selected(value) {
    var active = [];

    if (value) {
      active = [...active, value];
    }
    print(active);
  }
}

final categoryNotifierProvider =
    NotifierProvider<CategoryNotifier, List<Category>>(() {
  return CategoryNotifier();
});
