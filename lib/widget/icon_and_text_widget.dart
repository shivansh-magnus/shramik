import 'package:flutter/material.dart';
import 'package:shramik/widget/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final double size;
  final String text;
  final Color color;
  final Color iconColor;
  const IconAndText({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor,
    this.size = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          color: color,
          text: text,
          size: size,
        )
      ],
    );
  }
}
