import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/models/extra_item.dart';
import 'package:totem_test/models/order_item.dart';
import 'package:totem_test/models/product_item.dart';
import 'package:totem_test/providers/order_provider.dart';
import 'package:totem_test/services/utlis.dart';
import 'package:uuid/uuid.dart';

class ExtrasModal extends ConsumerStatefulWidget {
  const ExtrasModal({super.key, required this.product});

  final ProductItem product;

  @override
  ConsumerState<ExtrasModal> createState() => _ExtrasModalState();
}

class _ExtrasModalState extends ConsumerState<ExtrasModal> {
  late OrderItem orderTemp;
  int selectedProductIndex = 0;

  @override
  void initState() {
    super.initState();
    orderTemp = ref.read(orderProvider)!.clone();
  }

  @override
  Widget build(BuildContext context) {
    List<OrderRowItem> rowsPerProducts = orderTemp.rows
        .where((element) => element.productId == widget.product.productId)
        .toList();

    return Dialog(
      insetPadding: const EdgeInsets.fromLTRB(40, 80, 40, 80),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text('Personaliza il tuo gelato'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: (selectedProductIndex > 0)
                              ? () {
                                  setState(() {
                                    selectedProductIndex--;
                                  });
                                }
                              : null,
                          icon: const Icon(
                              CupertinoIcons.arrowtriangle_left_fill,
                              size: 40)),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.product.image!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            '${widget.product.description} ${selectedProductIndex + 1}',
                            style: const TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: (selectedProductIndex <
                                  rowsPerProducts.length - 1)
                              ? () {
                                  setState(() {
                                    selectedProductIndex++;
                                  });
                                }
                              : null,
                          icon: const Icon(
                              CupertinoIcons.arrowtriangle_right_fill,
                              size: 40)),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView(
                  children: widget.product.extras!.map((extra) {
                    return ExtrasRow(
                      key: Key(Uuid().v4()),
                      extra: Utils.getExtra(extra.extraId),
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Annulla'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('OK'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExtrasRow extends StatefulWidget {
  ExtrasRow({
    super.key,
    required this.extra,
  });

  ExtraItem extra;

  @override
  State<ExtrasRow> createState() => _ExtrasRowState();
}

class _ExtrasRowState extends State<ExtrasRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.extra.description),
        Switch(
          value: false,
          onChanged: (value) {},
          activeColor: Colors.pink.shade100,
        )
      ],
    );
  }
}
