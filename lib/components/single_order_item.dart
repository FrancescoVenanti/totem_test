import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/models/order_item.dart';
import 'package:totem_test/providers/order_provider.dart';
import 'package:totem_test/services/utlis.dart';

class SingleOrderItem extends ConsumerStatefulWidget {
  const SingleOrderItem({
    required this.row,
    super.key,
  });

  final OrderRowItem row;

  @override
  ConsumerState<SingleOrderItem> createState() => _SingleOrderItemState();
}

class _SingleOrderItemState extends ConsumerState<SingleOrderItem> {
  @override
  Widget build(BuildContext context) {
    var order = ref.watch(orderProvider);
    String productName = '';
    String productPrice = '0.0';
    for (var i = 0; i < Utils.products.length; i++) {
      if (widget.row.productId == Utils.products[i].productId) {
        productName = Utils.products[i].description;
        productPrice = Utils.products[i].price.toString();
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(203, 223, 223, 223),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    Utils.products
                        .firstWhere((element) =>
                            element.productId == widget.row.productId)
                        .image!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '$productName ',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('$productPrice €',
                    style:
                        const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                const Icon(CupertinoIcons.pencil,
                    color: Color.fromARGB(255, 0, 0, 0)),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(orderProvider.notifier)
                        .removeRow(widget.row.rowId);
                  },
                  child: const Icon(
                    CupertinoIcons.delete,
                    color: Colors.red,
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
