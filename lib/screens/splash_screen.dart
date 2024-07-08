import 'package:flutter/material.dart';
import 'package:totem_test/components/carousel.dart';
import 'package:totem_test/screens/order_screen.dart';

class SplashScreen extends StatelessWidget {
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
                    color: Color.fromARGB(255, 255, 150, 185)),
                child: Center(
                  child: Carousel(),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(gradient: myGradient),
                  child: const Center(
                    child: Text(
                      'Tocca per iniziare',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
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
