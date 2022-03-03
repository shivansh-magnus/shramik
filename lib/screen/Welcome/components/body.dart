import 'package:flutter/material.dart';
import 'package:shramik/screen/Login/login_screen_new.dart';
import 'package:shramik/screen/Signup/sign_up_new.dart';
import 'package:shramik/screen/Signup/signup_screen.dart';
import 'package:shramik/screen/Welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.12,
              ),
              Text(
                'Welcome to Shramik',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.04,
                ),
              ),
              SizedBox(
                height: size.height * 0.45,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    primary: Colors.black,
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUpPage();
                    }));
                  },
                  child: const Text(
                    "SIGNUP",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 35),
                    primary: Colors.black,
                    backgroundColor: Colors.black54,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ClipRReact {}
