import 'package:flutter/material.dart';
import 'package:totem_test/services/utlis.dart';
import 'package:totem_test/components/single_category.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key, required this.handleChangeCategory});

  final Function(String) handleChangeCategory;

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void handleClick(int i) {
      setState(() {
        selectedIndex = i;
      });
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          for (var i = 0; i < Utils.categories.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                    widget.handleChangeCategory(Utils.categories[i].categoryId);
                  });
                },
                child: SingleCategory(
                    text: Utils.categories[i].name,
                    image: Utils.categories[i].image,
                    cardColor: selectedIndex == i
                        ? Colors.white
                        : const Color.fromARGB(255, 255, 150, 185)),
              ),
            ),
        ],
      ),
    );
  }
}
