import 'package:flutter/material.dart';
import 'package:shramik/screen/Jobs/components/content.dart';
import 'package:shramik/screen/Jobs/components/custom_appBar.dart';
import 'package:shramik/widget/big_text.dart';
import 'components/jobs_photo.dart';

class JobsDetail extends StatelessWidget {
  const JobsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          jobs_photo(size: size),
          const custom_AppBar(),
          Content(size: size),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(size: size),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.09,
      padding: EdgeInsets.only(
        top: size.height * 0.015,
        bottom: size.height * 0.015,
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size.height * 0.02),
          topRight: Radius.circular(size.height * 0.02),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: size.height * 0.01,
              bottom: size.height * 0.01,
            ),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(size.height * 0.015),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.height * 0.002,
                ),
                Icon(
                  Icons.remove,
                  color: const Color(0xFF756d54),
                  size: size.height * 0.03,
                ),
                SizedBox(
                  width: size.height * 0.002,
                ),
                BigText(
                  text: "\$100",
                  color: const Color(0xFF756d54),
                  size: size.height * 0.025,
                ),
                SizedBox(
                  width: size.height * 0.002,
                ),
                Icon(
                  Icons.add,
                  color: const Color(0xFF756d54),
                  size: size.height * 0.03,
                ),
                SizedBox(
                  width: size.height * 0.002,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: size.height * 0.01,
              bottom: size.height * 0.01,
              left: size.width * 0.02,
              right: size.width * 0.02,
            ),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(
                size.height * 0.015,
              ),
            ),
            child: BigText(
              text: "Apply",
              color: const Color(0xFF756d54),
              size: size.height * 0.025,
            ),
          ),
        ],
      ),
    );
  }
}
