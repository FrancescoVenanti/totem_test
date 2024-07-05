import 'package:flutter/material.dart';
import 'package:totem_test/components/carousel.dart';
import 'package:totem_test/screens/order_screen.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const OrderScreen();
        })); */
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const OrderScreen()));
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 227, 117, 154)),
                child: Center(
                  child: Carousel(),
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Tocca per iniziare',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
