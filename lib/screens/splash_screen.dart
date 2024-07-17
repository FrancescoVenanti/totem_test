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
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: double.infinity,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 47, 47, 47),
                              borderRadius: BorderRadius.circular(200)),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Text(
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
                    ),
                  ],
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
