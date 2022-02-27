import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shramik/components/profileside.dart';
import 'package:shramik/widget/big_text.dart';
import 'package:shramik/widget/small_text.dart';

List<String> skills = [
  "Builder",
  "Woodcutter",
  "Painter",
  "Driver",
  "Actor",
  "Truck Driver",
  "Magician"
];

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PageController pageController = PageController(viewportFraction: 0.85);
  int profilepage = 2;
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void init() {
    super.initState();
    pageController.addListener(
      () {
        setState(() {
          _currPageValue = pageController.page!;
        });
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: profilepage,
                    itemBuilder: (context, index) {
                      return _buildPageItem(index);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ProfileSide(
                    size: size,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: DotsIndicator(
                dotsCount: profilepage,
                onTap: (position) {
                  setState(() => _currPageValue = position);
                },
                position: _currPageValue,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    int profilepage = 2;

    Size size = MediaQuery.of(context).size;
    return Container(
      height: _height,
      margin: const EdgeInsets.only(left: 2, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index.isEven ? Colors.greenAccent : Colors.blueAccent,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(5, 0),
            )
          ]),
      child:
          (index == 0) ? Profile_page1(size: size) : Profile_page2(size: size),
    );
  }
}

class Profile_page2 extends StatelessWidget {
  const Profile_page2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "Skills :-",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  skillText(skills),
                ],
              ),
            ]),
      ),
    );
  }
}

class Profile_page1 extends StatelessWidget {
  const Profile_page1({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 30.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    BigText(
                      text: "Welcome , Shivansh Dwivedi",
                      size: 14,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: "Location:",
                          size: 16,
                        ),
                        Row(
                          children: [
                            SmallText(text: "Country , City"),
                            const Icon(Icons.arrow_drop_down_rounded)
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: "Rating:",
                            size: 16,
                          ),
                          Row(children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => const Icon(
                                  Icons.star,
                                  color: Colors.redAccent,
                                  size: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallText(text: "4.5"),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallText(text: "1235"),
                            const SizedBox(
                              width: 5,
                            ),
                            SmallText(text: "comments"),
                          ]),
                        ])
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

Widget skillText(List<String> strings) {
  return Container(
    margin: const EdgeInsets.only(left: 50),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings
            .map((item) => Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                              text: item,
                              size: 16,
                              fontWeight: FontWeight.w700),
                          const SizedBox(
                            width: 2,
                          ),
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.redAccent,
                                size: 15,
                              ),
                            ),
                          )
                        ]),
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
                ))
            .toList()),
  );
}
