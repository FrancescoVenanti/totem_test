import 'package:flutter/material.dart';
import 'package:totem_test/screens/order_screen.dart';

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
                decoration: const BoxDecoration(color: Colors.amber),
                child: const Center(
                    child: Text('Questo blocco conterra un\'immagine')),
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
