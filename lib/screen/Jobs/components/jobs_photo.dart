import 'package:flutter/material.dart';

class jobs_photo extends StatelessWidget {
  const jobs_photo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: size.width,
        height: size.height * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/builder.png"),
          ),
        ),
      ),
    );
  }
}
