import 'package:flutter/material.dart';
import 'package:shramik/components/chatbox.dart';
import 'package:shramik/homepage/components/profile.dart';
import 'package:shramik/homepage/components/jobs.dart';

const primaryColor = Color(0xFFFDFDFD);
const secondaryColor = Color(0xFF252525);

class Background extends StatelessWidget {
  Background({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Stack(
          children: [
            Container(
              color: secondaryColor,
            ),
            Container(
              width: size.width,
              height: size.height * 0.5,
              child: Profile(),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(88),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: size.height * 0.65,
        child: Stack(children: [
          Container(
            color: primaryColor,
          ),
          Container(
            decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(88))),
          ),
          Container(
            child: Jobs(),
          )
        ]),
      )
    ]);
  }
}
