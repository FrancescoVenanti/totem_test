import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory({
    required this.text,
    required this.image,
    super.key,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: const Color.fromARGB(255, 255, 150, 185),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
