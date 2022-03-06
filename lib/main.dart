import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shramik/controllers/popular_job_controller.dart';
import 'package:shramik/screen/Welcome/welcome_screen.dart';
import 'package:shramik/constants.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularJobController>().getPopularJobList();
    return MaterialApp(
      title: 'Shramik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: WelcomeScreen(),
    );
  }
}
