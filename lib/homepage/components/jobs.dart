import 'package:flutter/material.dart';
import 'package:shramik/widget/big_text.dart';
import 'package:shramik/widget/icon_and_text_widget.dart';
import 'package:shramik/widget/small_text.dart';

class Jobs extends StatefulWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: size.width * 0.1),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          Row(
            children: [
              Text(
                "Jobs",
                style: TextStyle(
                  fontSize: size.height * 0.03,
                  color: Colors.greenAccent,
                ),
              ),
              SizedBox(width: size.width * 0.5),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Filter",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent,
                ),
              ),
            ],
          ),

          // List of jobs with images

          Expanded(
            child: Container(
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.002,
                          right: size.width * 0.05,
                          top: size.height * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Image in the row
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(size.height * 0.02),
                              color: Colors.white,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/robot.png",
                                  )),
                            ),
                          ),
                          // Job Description Container
                          Expanded(
                            child: Container(
                              height: 95,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(size.height * 0.02),
                                    bottomRight:
                                        Radius.circular(size.height * 0.02),
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.015,
                                    top: size.height * 0.01),
                                child: Column(
                                  children: [
                                    BigText(
                                      text: "Builder's Job",
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    SmallText(
                                      text:
                                          "For 2 months period we require a builder who could complete the total job alone . All tools are provided",
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: size.width * 0.01,
                                        right: size.width * 0.02,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          IconAndText(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            color: Colors.orange,
                                            iconColor: Colors.orange,
                                          ),
                                          IconAndText(
                                            icon: Icons.location_on,
                                            text: "1.7",
                                            color: Colors.greenAccent,
                                            iconColor: Colors.greenAccent,
                                          ),
                                          IconAndText(
                                            icon: Icons.access_time_rounded,
                                            text: "32min",
                                            color: Colors.orange,
                                            iconColor: Colors.orange,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
