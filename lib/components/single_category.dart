import 'package:flutter/material.dart';

class SingleCategory extends StatefulWidget {
  const SingleCategory({
    required this.text,
    required this.image,
    required this.cardColor,
    super.key,
  });

  final String text;
  final String image;
  final Color cardColor;

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: widget.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                widget.text,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
