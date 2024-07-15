import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/components/category_section.dart';
import 'package:totem_test/components/main_container.dart';
import 'package:totem_test/components/my_bottom_bar.dart';
import 'package:totem_test/components/single_product.dart';
import 'package:totem_test/components/top_bar.dart';
import 'package:totem_test/providers/category_provider.dart';
import 'package:totem_test/services/utlis.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key});

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedCategory = ref.watch(categoryProvider);
    final filteredProd = Utils.products
        .where((product) => product.categoryId == selectedCategory)
        .toList();

    if (filteredProd.length < 6) {
      setState(() {
        _selectedIndex = 0;
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: MainContainer(
        child: Column(
          children: [
            const TopBar(),
            const SizedBox(height: 20),
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
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemCount: _getItemCount(filteredProd.length),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return SingleProduct(
                                  prodotto:
                                      filteredProd[_getProductIndex(index)],
                                );
                              },
                            ),
                          ),
                          _buildNavigationButtons(filteredProd.length),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }

  int _getItemCount(int totalProducts) {
    final remainingProducts = totalProducts - (_selectedIndex * 6);
    return remainingProducts >= 6 ? 6 : remainingProducts;
  }

  int _getProductIndex(int index) {
    return _selectedIndex == 0 ? index : index + (_selectedIndex * 6);
  }

  Widget _buildNavigationButtons(int totalProducts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _selectedIndex > 0
              ? () => setState(() {
                    _selectedIndex--;
                  })
              : null,
          child: const Text('Previous'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent),
          onPressed: _hasNextPage(totalProducts)
              ? () => setState(() {
                    _selectedIndex++;
                  })
              : null,
          child: const Text('Next'),
        ),
      ],
    );
  }

  bool _hasNextPage(int totalProducts) {
    return totalProducts - (_selectedIndex * 6) > 6;
  }
}
