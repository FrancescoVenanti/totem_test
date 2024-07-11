import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
