import 'package:flutter/material.dart';

class custom_AppBar extends StatelessWidget {
  const custom_AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      left: size.width * 0.04,
      right: size.width * 0.04,
      top: size.height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.height * 0.05,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.05 / 2),
              color: const Color(0xFFfcf4e4),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: const Color(0xFF756d54),
                size: size.height * 0.04,
              ),
            ),
          ),
          Container(
            width: size.height * 0.05,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.05 / 2),
              color: const Color(0xFFfcf4e4),
            ),
            child: Icon(
              Icons.shopping_cart_rounded,
              color: const Color(0xFF756d54),
              size: size.height * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}
