import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(2)),
    );
  }
}
