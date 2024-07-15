import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/components/my_bottom_bar.dart';
import 'package:totem_test/components/single_order_item.dart';
import 'package:totem_test/providers/order_provider.dart';
import 'package:totem_test/screens/payment_screen.dart';

class OrderRecapScreen extends ConsumerStatefulWidget {
  const OrderRecapScreen({super.key});

  @override
  ConsumerState<OrderRecapScreen> createState() => _OrderRecapScreenState();
}

class _OrderRecapScreenState extends ConsumerState<OrderRecapScreen> {
  @override
  Widget build(BuildContext context) {
    var order = ref.watch(orderProvider);

    var totalPrice = ref.watch(orderProvider.notifier).getTotalPrice();

    List<Widget> orderList = order?.rows
        .map(
          (e) => SingleOrderItem(
            row: e,
            key: UniqueKey(),
          ),
        )
        .toList() as List<Widget>;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    '../assets/img/paymentBg.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child:
                                        const Icon(CupertinoIcons.arrow_left),
                                  ),
                                  const Text(
                                    'Riepilogo ordine',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: orderList,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const PaymentScreen()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Totale: $totalPrice €',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(159, 255, 183, 0),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(CupertinoIcons.money_dollar),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          'Vai al pagamento',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
