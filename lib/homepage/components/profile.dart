import 'package:flutter/material.dart';
import 'package:shramik/components/chatbox.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        height: 200,
        child: PageView.builder(
            controller: pageController,
            itemCount: 2,
            itemBuilder: (context, index) {
              return _buildPageItem(index);
            }),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: ProfileSide(
            size: size,
          ))
    ]);
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 1);
    }
    Size size = MediaQuery.of(context).size;
    return Transform(
      transform: matrix,
      child: Container(
        height: _height,
        margin: const EdgeInsets.only(left: 2, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(88),
          color: index.isEven ? Colors.greenAccent : Colors.blueAccent,
        ),
        child: (index == 0)
            ? Container(
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
                ))
            : Container(
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 26),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            skillText(skills),
                          ],
                        ),
                      ]),
                ),
              ),
      ),
    );
  }
}

class ProfileSide extends StatelessWidget {
  const ProfileSide({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black54,
      ),
      height: size.height * 0.2,
      width: size.width * 0.12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
            color: Colors.greenAccent,
          )),
          Expanded(
              child: IconButton(
            icon: const Icon(Icons.chat_bubble),
            onPressed: () {},
            color: Colors.greenAccent,
          )),
          Expanded(
              child: IconButton(
            icon: const Icon(Icons.help_center),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ChatBox();
                  },
                ),
              );
            },
            color: Colors.greenAccent,
          )),
        ],
      ),
    );
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
