import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText(
      {Key? key,
      this.color = const Color(0xDD000000),
      this.fontWeight = FontWeight.w400,
      required this.text,
      this.size = 12,
      this.height = 1.2,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        height: height,
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}
