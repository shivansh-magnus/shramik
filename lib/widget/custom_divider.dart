import 'package:flutter/material.dart';

class custom_Divider extends StatelessWidget {
  const custom_Divider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.004,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height * 0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withAlpha(225),
            blurRadius: size.height * 0.002,
            spreadRadius: size.height * 0.0005,
            offset: Offset(0, 0),
          ),
        ],
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF1000),
            Color(0xFF2508FF),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
    );
  }
}
