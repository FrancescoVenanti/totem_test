import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ExtrasModal extends StatefulWidget {
  const ExtrasModal({
    super.key,
    /* required this.rowId */
  });

  /* final String rowId; */

  @override
  State<ExtrasModal> createState() => _ExtrasModalState();
}

class _ExtrasModalState extends State<ExtrasModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
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
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.arrow_left)),
                      const Text('Gelato x'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.arrow_right)),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView(
                  children: const [
                    ExtrasRow(),
                    ExtrasRow(),
                    ExtrasRow(),
                    ExtrasRow(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {},
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

class ExtrasRow extends StatelessWidget {
  const ExtrasRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('extra 1'),
        Switch(
          value: false,
          onChanged: (value) {},
          activeColor: Colors.pink.shade900,
        )
      ],
    );
  }
}
