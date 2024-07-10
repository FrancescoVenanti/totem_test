import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryProvider extends StateNotifier<String?> {
  CategoryProvider() : super(null);

  void setCategory(String newCategory) {
    state = newCategory;
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryProvider, String?>((ref) {
  return CategoryProvider();
});
