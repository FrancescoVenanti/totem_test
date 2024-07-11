import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:totem_test/components/my_bottom_bar.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
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
                    color: const Color.fromARGB(212, 255, 255, 255)
                        .withOpacity(0.3),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.icecream,
                            color: Colors.white,
                            size: 38,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(CupertinoIcons.arrow_left,
                                      color: Colors.black)),
                              const Column(
                                children: [
                                  Text('Dove vorresti',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24)),
                                  Text('pagare?',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24)),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(CupertinoIcons.info,
                                      color: Colors.black)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Image.asset(
                                    '../assets/img/pagaTotem.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Image.asset(
                                    '../assets/img/pagaCassa.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Center(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.delete,
                                      color: Colors.red))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
