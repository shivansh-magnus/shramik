import 'package:flutter/material.dart';
import 'package:shramik/widget/big_text.dart';
import 'package:shramik/widget/custom_divider.dart';
import 'package:shramik/widget/expandable_text.dart';
import 'package:shramik/widget/jobs_column.dart';
import 'package:shramik/widget/small_text.dart';

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: size.height * 0.4,
      child: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          top: size.height * 0.02,
        ),
        height: size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.height * 0.06),
            topRight: Radius.circular(size.height * 0.06),
          ),
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const JobsColumn(
              text: "Builder's Job",
            ),
            SizedBox(
              height: size.height * 0.002,
            ),
            custom_Divider(size: size),
            SizedBox(
              height: size.height * 0.025,
            ),
            BigText(
              text: "Description",
              size: size.height * 0.025,
              color: Colors.greenAccent,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ExpandableTextWidget(
                    text:
                        "Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin vHello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin  vHello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin Hello Mister Lenin"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
