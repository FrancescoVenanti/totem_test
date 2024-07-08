import 'package:flutter/material.dart';
import 'package:totem_test/components/SingleCategory.dart';
import 'package:totem_test/services/utlis.dart';

class CategorySection extends StatelessWidget {
  CategorySection({
    super.key,
  });

  final categorie = Utils.categories;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Column(
        children: [
          SingleCategory(
            text: 'Gelato',
            image: "../assets/img/gelato.png",
          ),
          SingleCategory(
            text: 'Coppetta',
            image: "../assets/img/gelato2.png",
          ),
          SingleCategory(
            text: 'Vaschetta',
            image: "../assets/img/vaschetta.png",
          ),
          /* map categorie instead of static single category */
        ],
      ),
    );
  }
}
