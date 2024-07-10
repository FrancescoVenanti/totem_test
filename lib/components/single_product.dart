import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:totem_test/models/product_item.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({
    super.key,
    required this.prodotto,
  });

  final ProductItem prodotto;

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  int prodCounter = 0;
  @override
  Widget build(BuildContext context) {
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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        prodCounter > 0 ? prodCounter-- : prodCounter = 0;
                      });
                    },
                    child: const Icon(
                      CupertinoIcons.minus,
                      color: Colors.black,
                    )),
                Row(
                  children: [
                    Text(widget.prodotto.description),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$prodCounter'),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        prodCounter++;
                      });
                    },
                    child: const Icon(
                      CupertinoIcons.add,
                      color: Colors.black,
                    )),
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
