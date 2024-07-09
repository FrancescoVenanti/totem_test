import 'package:flutter/material.dart';
import 'package:totem_test/services/utlis.dart';
import 'package:totem_test/components/single_category.dart';

class CategorySection extends StatelessWidget {
  CategorySection({
    super.key,
  });
  final List<Widget> categorie = [];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < Utils.categories.length; i++) {
      categorie.add(SingleCategory(
          text: Utils.categories[i].name, image: Utils.categories[i].image));
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: categorie,
      ),
    );
  }
}
