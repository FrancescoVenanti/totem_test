import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/providers/order_provider.dart';

class TopBar extends ConsumerWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int badgeCounter = ref.watch(orderProvider)?.rows.length ?? 0;
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
          badges.Badge(
            badgeAnimation: const badges.BadgeAnimation.scale(
              animationDuration: Duration(seconds: 1),
              loopAnimation: true,
            ),
            badgeStyle: const badges.BadgeStyle(
                badgeColor: Color.fromARGB(255, 238, 61, 120)),
            badgeContent: Text(
              badgeCounter.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: const Icon(
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
