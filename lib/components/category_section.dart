import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/providers/category_provider.dart';
import 'package:totem_test/services/utlis.dart';
import 'package:totem_test/components/single_category.dart';

class CategorySection extends ConsumerStatefulWidget {
  const CategorySection({super.key});

  @override
  ConsumerState<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends ConsumerState<CategorySection> {
  @override
  Widget build(BuildContext context) {
    String? selectedCategory = ref.watch(categoryProvider);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          for (var i = 0; i < Utils.categories.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(categoryProvider.notifier)
                      .setCategory(Utils.categories[i].categoryId);
                },
                child: SingleCategory(
                    text: Utils.categories[i].name,
                    image: Utils.categories[i].image,
                    cardColor:
                        selectedCategory == Utils.categories[i].categoryId
                            ? Colors.white
                            : const Color.fromARGB(255, 255, 150, 185)),
              ),
            ),
        ],
      ),
    );
  }
}
