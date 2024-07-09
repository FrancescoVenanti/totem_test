import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:totem_test/models/category_item.dart';

class Utils {
  static List<CategoryItem> categories = [];
  static Future initCategories() async {
    final categoriesString = await rootBundle.loadString('data/categorie.json');
    final objCategories = jsonDecode(categoriesString) as List<dynamic>;

    /* for (int i = 0; i < objCategories.length; i++) {
      categories.add(CategoryItem.fromJson(objCategories[i]));
    } */
    for (var item in objCategories) {
      categories.add(CategoryItem.fromJson(item));
    }
  }
}
