import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/components/category_section.dart';
import 'package:totem_test/components/main_container.dart';
import 'package:totem_test/components/my_bottom_bar.dart';
import 'package:totem_test/components/single_product.dart';
import 'package:totem_test/components/top_bar.dart';
import 'package:totem_test/models/product_item.dart';
import 'package:totem_test/providers/category_provider.dart';
import 'package:totem_test/services/utlis.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({
    super.key,
  });

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    String? selectedCategory = ref.watch(categoryProvider);

    List<ProductItem> filteredProd = Utils.products.where((element) {
      return element.categoryId == selectedCategory;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: MainContainer(
        child: Column(
          children: [
            const TopBar(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 238, 61, 120),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const CategorySection(),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView(
                        children: filteredProd
                            .map((element) => SingleProduct(
                                prodotto: element,
                                key: ValueKey(element.productId)))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
