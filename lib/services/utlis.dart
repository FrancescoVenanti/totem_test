import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:totem_test/models/category_item.dart';
import 'package:totem_test/models/extra_item.dart';
import 'package:totem_test/models/order_item.dart';
import 'package:totem_test/models/product_item.dart';
import 'package:uuid/uuid.dart';

class Utils {
  static List<CategoryItem> categories = [];
  static Future initCategories() async {
    final categoriesString = await rootBundle.loadString('data/categorie.json');
    final objCategories = jsonDecode(categoriesString) as List<dynamic>;
    for (var item in objCategories) {
      categories.add(CategoryItem.fromJson(item));
    }
  }

  static List<ProductItem> products = [];
  static Future initProducts() async {
    final productString = await rootBundle.loadString('data/prodotti.json');
    final objCategories = jsonDecode(productString) as List<dynamic>;
    for (var item in objCategories) {
      products.add(ProductItem.fromJson(item));
    }
  }

  static List<ExtraItem> extras = [];
  static Future initExtras() async {
    final extrasString = await rootBundle.loadString('data/varianti.json');
    final objCategories = jsonDecode(extrasString) as List<dynamic>;
    for (var item in objCategories) {
      extras.add(ExtraItem.fromJson(item));
    }
  }

  static String getUUID() {
    return const Uuid().v8();
  }

  static int getProductsRowCount(OrderItem order, String productId) {
    return order.rows.where((element) {
      return element.productId == productId;
    }).length;
  }
}
