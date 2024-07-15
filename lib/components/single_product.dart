import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/components/extras_modal.dart';
import 'package:totem_test/models/product_item.dart';
import 'package:totem_test/providers/order_provider.dart';

class SingleProduct extends ConsumerStatefulWidget {
  const SingleProduct({
    super.key,
    required this.prodotto,
  });

  final ProductItem prodotto;

  @override
  ConsumerState<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends ConsumerState<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    int? itemQt = ref
        .watch(orderProvider)
        ?.rows
        .where((element) => element.productId == widget.prodotto.productId)
        .length;
    return Card(
      elevation: 5,
      color: const Color.fromARGB(255, 255, 188, 211),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    widget.prodotto.image!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ExtrasModal(),
                      );
                    },
                    child: const Icon(
                      CupertinoIcons.pencil,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
              ],
            ),
            Text(widget.prodotto.description),
            Text('${widget.prodotto.price.toString()} €'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () => ref
                        .read(orderProvider.notifier)
                        .removeItem(widget.prodotto.productId),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(
                        CupertinoIcons.minus,
                        color: Colors.black,
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$itemQt'),
                  ),
                ),
                GestureDetector(
                  onTap: () => ref
                      .read(orderProvider.notifier)
                      .addItem(widget.prodotto.productId),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Icon(
                      CupertinoIcons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
