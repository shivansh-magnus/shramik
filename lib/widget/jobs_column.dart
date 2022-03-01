import 'package:flutter/material.dart';

import 'big_text.dart';
import 'icon_and_text_widget.dart';

class JobsColumn extends StatelessWidget {
  final String text;
  const JobsColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: size.height * 0.03,
          color: Colors.greenAccent,
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.01,
            right: size.width * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndText(
                icon: Icons.circle_sharp,
                text: "\$100",
                size: size.height * 0.02,
                color: Colors.orange,
                iconColor: Colors.orange,
              ),
              IconAndText(
                icon: Icons.location_on,
                text: "1.7km",
                size: size.height * 0.02,
                color: Colors.greenAccent,
                iconColor: Colors.greenAccent,
              ),
              IconAndText(
                icon: Icons.access_time_rounded,
                text: "32min",
                size: size.height * 0.02,
                color: Colors.red,
                iconColor: Colors.red,
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.01,
            right: size.width * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconAndText(
                icon: Icons.people,
                text: "30",
                size: size.height * 0.02,
                color: Colors.blue,
                iconColor: Colors.blue,
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              IconAndText(
                icon: Icons.timeline_rounded,
                text: "5 days",
                size: size.height * 0.02,
                color: Colors.greenAccent,
                iconColor: Colors.greenAccent,
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
      ],
    );
  }
}
