import 'package:flutter/material.dart';

const primaryColor = Color(0xFFFDFDFD);
const secondaryColor = Color(0xFF252525);
List<String> skills = ["Builder", "Woodcutter", "Painter"];

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.height * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpg'),
              radius: 30.0,
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            Text(
              "Welcome , Shivansh Dwivedi",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height * 0.0159),
            )
          ]),
          SizedBox(
            height: size.height * 0.02,
          ),
          const Text(
            "Skills :-",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          skillText(skills)
        ],
      ),
    );
  }
}

Widget skillText(List<String> strings) {
  return Container(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings
            .map((item) => Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(
                    item,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))
            .toList()),
  );
}
