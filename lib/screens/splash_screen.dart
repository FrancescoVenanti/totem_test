import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/components/carousel.dart';
import 'package:totem_test/components/my_bottom_bar.dart';
import 'package:totem_test/providers/category_provider.dart';
import 'package:totem_test/providers/order_provider.dart';
import 'package:totem_test/screens/order_screen.dart';
import 'package:totem_test/services/utlis.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({
    super.key,
  });

  final myGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromARGB(255, 255, 150, 185),
        Color.fromARGB(255, 255, 255, 255),
      ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref
            .read(categoryProvider.notifier)
            .setCategory(Utils.categories[0].categoryId);

        ref.read(orderProvider.notifier).init();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const OrderScreen()));
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 150, 185)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Carousel(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(gradient: myGradient),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(200)),
                            child: const Text(
                              'Tocca per iniziare',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
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
        bottomNavigationBar: const MyBottomBar(),
      ),
    );
  }
}
