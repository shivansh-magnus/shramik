import 'package:flutter/material.dart';
import 'package:shramik/widget/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = 110;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: size.height * 0.01),
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              color: Colors.greenAccent,
            )
          : Column(
              children: [
                SmallText(
                  size: size.height * 0.015,
                  color: Colors.white,
                  text: hiddenText
                      ? (firstHalf + "...")
                      : (firstHalf + secondHalf),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      (hiddenText == true)
                          ? hiddenText = false
                          : hiddenText = true;
                    });
                  },
                  child: (hiddenText == true)
                      ? Row(
                          children: [
                            SmallText(
                              size: size.height * 0.013,
                              text: "Show More",
                              color: Colors.greenAccent,
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.greenAccent,
                              size: size.height * 0.013,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            SmallText(
                              size: size.height * 0.013,
                              text: "Show Less",
                              color: Colors.greenAccent,
                            ),
                            Icon(
                              Icons.arrow_drop_up_sharp,
                              color: Colors.greenAccent,
                              size: size.height * 0.013,
                            ),
                          ],
                        ),
                )
              ],
            ),
    );
  }
}
