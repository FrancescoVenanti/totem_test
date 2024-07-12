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
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    String? selectedCategory = ref.watch(categoryProvider);

    List<ProductItem> filteredProd = Utils.products.where((element) {
      return element.categoryId == selectedCategory;
    }).toList();

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
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemCount: filteredProd.length -
                                          (_selectedIndex * 6) >=
                                      6
                                  ? 6
                                  : filteredProd.length - (_selectedIndex * 6),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return SingleProduct(
                                  prodotto: filteredProd[
                                      _selectedIndex == 0 ? index : index + 6],
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_selectedIndex == 0) {
                                      return;
                                    }
                                    _selectedIndex = _selectedIndex - 1;
                                  });
                                },
                                child: const Text('Previous'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Colors.amberAccent)),
                                onPressed: () {
                                  setState(() {
                                    if (filteredProd.length -
                                            (_selectedIndex * 6) <
                                        6) {
                                      return;
                                    }
                                    _selectedIndex = _selectedIndex + 1;
                                  });
                                },
                                child: const Text('Next'),
                              ),
                            ],
                          )
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
}

int itemCount(int index) {
  if (index == 0) {
    return 0;
  }
  return index < 6 ? index : 6;
}

int pageItemCount(int length, int index) {
  return length - (index * 6);
}
