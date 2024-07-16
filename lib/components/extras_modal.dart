import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/models/order_item.dart';
import 'package:totem_test/models/product_item.dart';
import 'package:totem_test/providers/order_provider.dart';
import 'package:totem_test/services/utlis.dart';

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
    setState(() {
      orderTemp = OrderItem(
          rows: ref
              .read(orderProvider)!
              .rows
              .where((element) => element.productId == widget.product.productId)
              .toList());
    });
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
                    String extraText =
                        Utils.getExtra(extra.extraId).description;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(extraText),
                        Switch(
                          value: orderTemp.rows[selectedProductIndex].extras!
                              .where(
                                  (element) => element.extraId == extra.extraId)
                              .isNotEmpty,
                          onChanged: (value) {
                            setState(() {
                              if (value) {
                                orderTemp.rows[selectedProductIndex].extras!
                                    .add(
                                  OrderExtraItem(
                                    extraId: extra.extraId,
                                    qty: 1,
                                  ),
                                );
                              } else {
                                orderTemp.rows[selectedProductIndex].extras!
                                    .removeWhere((element) =>
                                        element.extraId == extra.extraId);
                              }
                            });
                          },
                          activeColor: Colors.pink.shade100,
                        ),
                      ],
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
                    onPressed: () {
                      ref.read(orderProvider.notifier).addExtra(orderTemp);
                      Navigator.of(context).pop();
                    },
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




/* return ExtrasRow(
                      key: Key(const Uuid().v4()),
                      extra: Utils.getExtra(extra.extraId),
                      selected: orderTemp.rows[selectedProductIndex].extras!
                          .contains(OrderExtraItem(
                        extraId: extra.extraId,
                        qty: 1,
                      )),
                      onChanged: (value) {
                        setState(() {
                          if (value) {
                            orderTemp.rows[selectedProductIndex].extras!.add(
                              OrderExtraItem(
                                extraId: extra.extraId,
                                qty: 1,
                              ),
                            );
                          } else {
                            orderTemp.rows[selectedProductIndex].extras!
                                .remove(OrderExtraItem(
                              extraId: extra.extraId,
                              qty: 1,
                            ));
                          }
                        });
                      },
                    ); */