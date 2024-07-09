import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:totem_test/models/product_item.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({
    super.key,
    required this.a,
  });

  final ProductItem a;

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  int prodCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 188, 211),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 40, 8, 40),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  setState(() {
                    prodCounter > 0 ? prodCounter-- : prodCounter = 0;
                  });
                },
                child: const Icon(CupertinoIcons.minus)),
            Text(widget.a.description),
            Text(prodCounter.toString()),
            OutlinedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  setState(() {
                    prodCounter++;
                  });
                },
                child: const Icon(CupertinoIcons.add)),
          ],
        )),
      ),
    );
  }
}
