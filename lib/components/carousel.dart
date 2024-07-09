import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});

  final List<String> images = [
    '../assets/img/gelatoBg.jpg',
    '../assets/img/gelatoBg2.jpg',
    '../assets/img/gelatoBg3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: FlutterCarousel(
        options: CarouselOptions(
          viewportFraction: 1,
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    i,
                    fit: BoxFit.cover,
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}
