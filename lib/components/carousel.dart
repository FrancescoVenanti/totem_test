import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});

  final List<String> images = [
    '../lib/assets/img/gelato.png',
    '../lib/assets/img/gelato2.png',
    '../lib/assets/img/gelato3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        height: 400.0,
        showIndicator: false,
        slideIndicator: const CircularSlideIndicator(),
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayInterval: const Duration(seconds: 2),
        enableInfiniteScroll: true,
      ),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(i));
          },
        );
      }).toList(),
    );
  }
}
