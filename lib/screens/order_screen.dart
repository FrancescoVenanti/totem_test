import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:totem_test/components/category_section.dart';
import 'package:totem_test/components/single_product.dart';
import 'package:totem_test/models/product_item.dart';
import 'package:totem_test/services/utlis.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String selectedCategory = Utils.categories[0].categoryId;
  @override
  Widget build(BuildContext context) {
    void handleChangeCategory(String cat) {
      setState(() {
        selectedCategory = cat;
      });
    }

    List<ProductItem> filteredProd = Utils.products.where((element) {
      return element.categoryId == selectedCategory;
    }).toList();

    List<Widget> prodotti = [];
    for (var element in filteredProd) {
      prodotti.add(SingleProduct(a: element));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 150, 185),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Contenitore totale ordine')),
            ),
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
                      child: CategorySection(
                        handleChangeCategory: handleChangeCategory,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: prodotti,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 150, 185),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Contenitore footer')),
            ),
          ],
        ),
      ),
    );
  }
}
