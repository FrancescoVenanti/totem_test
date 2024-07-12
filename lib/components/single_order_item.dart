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
    var order = ref.read(orderProvider);
    String productName = '';
    for (var i = 0; i < Utils.products.length; i++) {
      print(productName);
      if (widget.row.productId == Utils.products[i].productId) {
        productName = Utils.products[i].description;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(111, 111, 111, 111),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$productName ',
              style: const TextStyle(color: Colors.white),
            ),
            const Row(
              children: [
                Text('prezzo', style: TextStyle(color: Colors.white)),
                Icon(CupertinoIcons.pencil, color: Colors.white),
                Icon(
                  CupertinoIcons.delete,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
