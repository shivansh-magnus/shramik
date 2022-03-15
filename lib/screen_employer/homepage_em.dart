import 'package:flutter/material.dart';
import 'package:shramik/screen_employer/Homepage/components/body.dart';

const primaryColor = Color(0xFFFDFDFD);
const secondaryColor = Color(0xFF252525);
const double iconSize = 36;

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              backgroundColor: primaryColor,
              iconTheme: IconThemeData(color: secondaryColor, size: iconSize),),),
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.04,
              bottom: size.height * 0.04,
            ),
            child: const Icon(
              Icons.grid_view,
            ),
          ),
          elevation: 0.1,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: iconSize,
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/avatar.jpg",
                      width: size.height * 0.04,
                    )),
              ),
              Positioned(
                top: 6,
                right: size.height * 0.005,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red),
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              )
            ])
          ],
        ),
        body: Background(size: size),
      ),
    );
  }
}
