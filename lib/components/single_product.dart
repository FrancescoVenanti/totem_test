import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 188, 211),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 40, 8, 40),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.prodotto.description),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () => ref
                            .read(orderProvider.notifier)
                            .removeItem(widget.prodotto.productId),
                        child: const Icon(
                          CupertinoIcons.minus,
                          color: Colors.black,
                        )),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$itemQt'),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () => ref
                            .read(orderProvider.notifier)
                            .addItem(widget.prodotto.productId),
                        child: const Icon(
                          CupertinoIcons.add,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            )),
          ),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
