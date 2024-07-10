import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleOrderItem extends StatelessWidget {
  const SingleOrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(111, 111, 111, 111),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nome prodotto',
              style: TextStyle(color: Colors.white),
            ),
            Row(
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
