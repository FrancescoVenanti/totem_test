import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const badges.Badge(
            badgeStyle: badges.BadgeStyle(
                badgeColor: Color.fromARGB(255, 238, 61, 120)),
            badgeContent: Text(
              '0',
              style: TextStyle(color: Colors.white),
            ),
            child: Icon(
              Icons.shopping_cart,
              size: 32,
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Il tuo ordine',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '0,00€',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(),
          ElevatedButton(
              style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.fromLTRB(12, 20, 12, 20)),
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 238, 61, 120))),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vai al pagamento',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    CupertinoIcons.arrowtriangle_right_fill,
                    color: Colors.white,
                    size: 8,
                  )
                ],
              ))
        ],
      )),
    );
  }
}
