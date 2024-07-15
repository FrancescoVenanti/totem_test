import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/providers/order_provider.dart';
import 'package:totem_test/screens/order_recap_screen.dart';

class TopBar extends ConsumerStatefulWidget {
  const TopBar({
    super.key,
  });

  @override
  ConsumerState<TopBar> createState() => _TopBarState();
}

class _TopBarState extends ConsumerState<TopBar> {
  @override
  Widget build(BuildContext context) {
    var orderWatcher = ref.watch(orderProvider);
    String? badgeCounter = ref.watch(orderProvider)?.rows.length.toString();
    num? totalPrice = ref.watch(orderProvider.notifier).getTotalPrice();
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 255, 188, 211),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            badges.Badge(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Il tuo ordine',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '$totalPrice €',
                  style: const TextStyle(fontSize: 18),
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
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OrderRecapScreen()));
              },
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
