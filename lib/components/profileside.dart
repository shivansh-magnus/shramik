import 'package:flutter/material.dart';
import 'chatbox.dart';

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
      width: 50,
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
